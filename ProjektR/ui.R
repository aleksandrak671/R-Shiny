# dodaje wymagane biblioteki
library(shiny)
library(shinyWidgets)

# interfejs użytkownika
shinyUI(
  fluidPage(
    # tytuł aplikacji
    titlePanel("Analiza odpadów plastikowych"),
    
    # pasek do nawigacji pomiędzy różnymi zakładkami
    navbarPage(
      "Klasteryzacja k-średnich",
      
      # zakładka gdzie wczytuje się dane
      tabPanel("Dane",
               sidebarLayout(
                 sidebarPanel(
                   # przycisk i elementy do sterowania aplikacją
                   fileInput("file", "Wczytaj dane", accept = c(".csv")), # przycisk aby wczytać pliku z danymi CSV
                   actionButton("process", "Przetwórz dane") # przycisk do przetwarzania dodanych danych
                 ),
                 mainPanel(
                   # wyświetlam podsumowania i podgląd danych
                   verbatimTextOutput("data_summary"), # podsumowanie danych
                   tableOutput("data_preview") # pierwsze wiersze wybranych danych
                 )
               )
      ),
      
      # zakładka do normalizacji danych (przekształcanie wartości w danych, 
      # aby wszystkie zmienne miały podobną skalę. są przekształcane tak, aby miały średnią 0 i odchylenie standardowe 1)
      tabPanel("Normalizacja",
               sidebarLayout(
                 sidebarPanel(
                   # przycisk do przekształcania danych
                   actionButton("normalize", "Znormalizuj dane")
                 ),
                 mainPanel(
                   # wyświetlanie znormalizowanych danych
                   tableOutput("normalized_data")
                 )
               )
      ),
      
      # zakładka do klasteryzacji danych (pozwala znaleźć grupy (klastry) w dodanych danych, które są do siebie podobne
      # pozwala na analizę i interpretację danych w kontekście tych grup (np dla naszych danych: kraje z podobnym poziomem odpadów plastikowych)
      tabPanel("Klasteryzacja",
               sidebarLayout(
                 sidebarPanel(
                   # suwak do wyboru liczby grup (klastrów)
                   sliderInput("clusters", "Liczba klastrów:", min = 2, max = 10, value = 3),
                   actionButton("cluster", "Uruchom klasteryzację") # przycisk do wykonania tego
                 ),
                 mainPanel(
                   # wyświetlanie wyników klasteryzacji
                   plotOutput("cluster_plot"), # wykres wybranych grup (klastrów)
                   verbatimTextOutput("cluster_summary") # Szczegóły klasteryzacji
                 )
               )
      ),
      
      # zakładka do oceny jakości klasteryzacji (jakości znalezienia grupy w dodanych danych, które są do siebie podobne)
      tabPanel("Jakość",
               sidebarLayout(
                 sidebarPanel(
                   # przycisk do wykonania
                   actionButton("quality", "Oceń jakość")
                 ),
                 mainPanel(
                   # wyświetlanie wskaźnika jakości
                   verbatimTextOutput("quality_index")
                 )
               )
      )
    )
  )
)
