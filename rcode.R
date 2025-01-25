set.seed(111)       # seed dla powtarzalności

# Generowanie 1000 obserwacji z rozkładu chi-kwadrat o 5 stopniach swobody
x <- rchisq(1000, df = 5)

# Tworzenie histogramu z naniesioną funkcją gęstości
hist(x, probability = TRUE, breaks = 30, col = "lightblue", main = "Histogram z funkcją gęstości rozkładu chi-kwadrat",
     xlab = "Wartości obserwacji ", ylab = "Gęstość")

# Dodanie funkcji gęstości rozkładu chi-kwadrat
curve(dchisq(x, df = 5), col = "red", lwd = 2, add = TRUE)


#SYMULACJA

k <- 5               #liczba stopni swobody
m <- 5               # Wartość oczekiwana
sigma <- sqrt(10)     # Odchylenie standardowe
n <- 1000             # Liczba obserwacji w pojedynczej próbie
s <- 10000           # Liczba powtórzeń

# Inicjalizacja macierzy wyników: każdy wiersz to ciąg z_j dla jednej symulacji
z_matrix <- matrix(0, nrow = s, ncol = n)

# Symulacja s prób i obliczanie z_j
for (i in 1:s) {
  x <- rchisq(n, df = k)  # Generowanie ciągu obserwacji
  for (j in 1:n) {
    x_mean <- mean(x[1:j])  # Średnia z pierwszych j obserwacji
    z_matrix[i, j] <- (x_mean - m) / (sigma / sqrt(j))  # Obliczenie z_j
  }
}

# Wybór wartości j do analizy histogramów
j_values <- c(3, 5, 10, 100, 500, 1000)

# Rysowanie histogramów dla wybranych j
for (j in j_values) {
  z_j_values <- z_matrix[ ,j] # Pobranie j-tej kolumny z macierzy
  
  # Rysowanie histogramu
  hist(z_j_values, probability = TRUE, breaks = 30, col = "lightblue",
       main = paste("Histogram dla j =", j),
       xlab = paste("Realizacje zmiennej losowej Z_", j, sep = ""), ylab = "Gęstość")
  
  # Naniesienie funkcji gęstości N(0, 1)
  curve(dnorm(x, mean = 0, sd = 1), col = "red", lwd = 2, add = TRUE)
  
  # Dodanie legendy
  legend("topright", legend = c("N(0,1)"), 
         col = c("red"), lwd = 2)
}


for (j in j_values) {
  z_j_values <- z_matrix[ ,j] # Pobranie j-tej kolumny z macierzy
  
  empirical_cdf <- ecdf(z_j_values)  # Empiryczna dystrybuanta dla Z_j
  
  # Wykres empirycznej i teoretycznej dystrybuanty
  plot(empirical_cdf, col = "blue", lwd = 2, main = paste("Porównanie dystrybuant dla j =", j),
       xlab = "z", ylab = "Dystrybuanta", xlim = c(-4, 4), ylim = c(0, 1))
  curve(pnorm(x, mean = 0, sd = 1), col = "red", lwd = 2, add = TRUE)  # Dystrybuanta N(0,1)
  
  # Legenda
  legend("bottomright", legend = c("Dystrybuanta rozkładu zmiennej Z_j", "Dystrybuanta N(0,1)"),
         col = c("blue", "red"), lwd = 2)
}