
require 'watir'
require 'rubygems'
require 'selenium-webdriver'
Selenium::WebDriver::Firefox.path = 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe'
livro = Watir::Browser.new :firefox
	
   # Submarino
	livro.goto 'https://www.submarino.com.br'
    livro.text_field(:id, 'h_search-input').send_keys("livros")
	

    livro.button(:id, 'h_search-btn').click()
	sleep 5
    livro.link(:class => 'card-product-url').click()
    $Autor_Submarino = livro.tr(:text, /Autor/).td(:index => 1).text
    $ISBN_Submarino = livro.tr(:text, /ISBN/).td(:index => 1).text
    
    # Americanas
    livro.goto 'https://www.americanas.com.br'

    livro.text_field(:id, 'h_search-input').send_keys($ISBN_Submarino)
    livro.button(:id, 'h_search-btn').click()
	sleep 5
    livro.link(:class => 'card-product-url').click()
    $Autor_Americanas = livro.tr(:text, /Autor/).td(:index => 1).text
    $ISBN_Americanas = livro.tr(:text, /ISBN/).td(:index => 1).text
      
         # Shoptime
    livro.goto 'https://www.shoptime.com.br/'
    
    livro.text_field(:id, 'h_search-input').send_keys($ISBN_Submarino)
    livro.button(:id, 'h_search-btn').click()
	sleep 5
    livro.link(:class => 'card-product-url').click()
    $Autor_Shoptime = livro.tr(:text, /Autor/).td(:index => 1).text
    $ISBN_Shoptime = livro.tr(:text, /ISBN/).td(:index => 1).text
      




describe 'Livro submarino e Americanas' do
  
  it 'Comparado se o Autor do Livro é o Mesmo' do
    puts "Autor Americanas: "+$Autor_Americanas
    puts "Autor Submarino: "+$Autor_Submarino
    puts "ISBN Americanas: "+$ISBN_Americanas

    expect($Autor_Submarino).to eq($Autor_Americanas)

    end

end


describe 'Livro submarino e Shoptime' do
  
  it 'Comparado se o Autor do Livro é o Mesmo' do
   
   puts "Autor Shoptime: "+ $Autor_Shoptime
   puts "Autor Submarino: "+$Autor_Submarino
   puts "ISBN Shoptime: "+ $ISBN_Shoptime
   expect($Autor_Submarino).to eq($Autor_Shoptime)

    end

end

