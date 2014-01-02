class TestController < ApplicationController
  def index
    render :json => files
  end
      
  private
  def files
    Dir.glob(Rails.root.to_s + '/**/*')
  end
  
  def cfignore
    File.read(File.join(Rails.root,'.cfignore')).split("\n")
  end
  
  def ignored_files
    puts Dir.pwd
    cfignore.reject(&:empty?).map do |line|
      first = Dir.glob(line.start_with?('/') ? File.join(Rails.root, line) : File.join('**', line), File::FNM_DOTMATCH)
      second = Dir.glob(File.join('**', line, '**', '*'), File::FNM_DOTMATCH)
      puts [line, first, second].inspect
      [first + second].flatten
    end.flatten
  end
end
