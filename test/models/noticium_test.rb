require 'test_helper'

class NoticiumTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "validaciones" do
    noticia = Noticium.new(:title => "My Book Title" , :content => "yyyddddddddddddddd")
    assert noticia.valid?

    noticia2 = noticia(:one)
    assert noticia2.valid?

    noticia3 = Noticium.new(:title => "My" , :content => "yyyddddddddddddddd")
    assert !noticia3.save

    noticia4 = Noticium.new(:title => "My dasdasd" , :content => "yya")
    assert noticia4.invalid?
  end


end