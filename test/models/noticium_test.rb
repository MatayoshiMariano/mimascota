require 'test_helper'

class NoticiumTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "validaciones" do
    noticia = Noticia.new(:title => "My Book Title" , :content => "yyy")
    assert product.valid?
  end

end