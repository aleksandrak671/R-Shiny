# dodaje wymagane biblioteki
library(shiny)
library(cluster) # biblioteka do klasteryzacji (klasteryzacja-pozwala znaleźć grupy (klastry) w dodanych danych, które są do siebie podobne)
library(ggplot2) # biblioteka do tworzenia wykresów

# logika serwera aplikacji (miejsce, gdzie pisze jak aplikacja ma reagować na działania użytkownika i co ma wyświetlać na ekranie)
shinyServer(function(input, output, session) {
  
  # zmienne reaktywne do przechowywania danych
  data <- reactiveVal(NULL) # przechowuje oryginalne dane
  normalized <- reactiveVal(NULL) # przechowuje znormalizowane dane
  clusters <- reactiveVal(NULL) # przechowuje wyniki klasteryzacji
  
  # wczytywanie danych z dodanego pliku CSV
  observeEvent(input$file, {
    req(input$file) # sprawdzanie czy plik został wybrany
    data(read.csv(input$file$datapath)) # wczytuje dane z pliku CSV
    # wyświetlenie podsumowania danych (np. średnie, minimalne i maksymalne wartości)
    output$data_summary <- renderPrint({ summary(data()) })
    # wyświetlenie pierwszych kilku wierszy danych w tabeli
    output$data_preview <- renderTable({ head(data()) })
  })
  
  # normalizacja danych (przekształcanie wartości w danych, aby wszystkie zmienne miały podobną skalę. 
  # skalowanie do średniej 0 i odchylenia standardowego 1)
  observeEvent(input$normalize, {
    req(data()) # sprawdzanie czy dane zostały wczytane
    # wybieranie tylko kolumn numeryczne z danych
    numeric_data <- data()[, sapply(data(), is.numeric)]
    normalized(scale(numeric_data)):
    # normalizowanie danych (skalowanie) - przypisuje wynik normalizacji (zwrot z scale(numeric_data)) do reaktywnej zmiennej normalized.
    # normalized to miejsce, w którym aplikacja przechowuje znormalizowane dane do późniejszego wykorzystania (np. klasteryzacji).
    normalized(scale(numeric_data)) 
    # wyświetlanie znormalizowanych danych w tabeli
    output$normalized_data <- renderTable({ head(normalized()) })
  })
  
  # klasteryzacja metodą k-średnich
  observeEvent(input$cluster, {
    req(normalized()) # sprawdzanie czy dane są znormalizowane
    # wykonywanie klasteryzację k-średnich na znormalizowanych danych
    fit <- kmeans(normalized(), centers = input$clusters)
    clusters(fit) # zapisywanie wyników klasteryzacji
    # rysowanie wykresu klastrów
    output$cluster_plot <- renderPlot({
      cluster_data <- as.data.frame(normalized()) # tworzenie ramki danych znormalizowanych
      cluster_data$cluster <- as.factor(fit$cluster) # dodanie kolumny z przypisaniem do klastrów
      # tworzenie wykresu punktowego z kolorami odpowiadającymi klastrom
      ggplot(cluster_data, aes(x = cluster_data[,1], y = cluster_data[,2], color = cluster)) +
        geom_point() +
        labs(title = "Klasteryzacja k-średnich", x = "Wymiar 1", y = "Wymiar 2")
    })
    # wyświetlenie szczegółów wyników klasteryzacji (np rozmiary i środki klastrów)
    output$cluster_summary <- renderPrint({ print(fit) })
  })
  
  # ocena jakości klasteryzacji (wskaźnik silhouette)
  observeEvent(input$quality, {
    req(clusters()) # sprawdzenie czy klasteryzacja została wykonana
    # obliczenie wskaźnika silhouette dla klasteryzacji
    quality <- silhouette(clusters()$cluster, dist(normalized()))
    # wyświetlenie podsumowania wskaźnika silhouette
    output$quality_index <- renderPrint({ summary(quality) })
  })
})
