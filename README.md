# probability-and-statistics-clt-project
Simple simulation in R showing the central limit theorem.

## Overview
This project demonstrates the Central Limit Theorem (CLT) through a simulation using the R programming language. It generates random samples from a chi-square distribution and examines how the sample mean distribution converges to a normal distribution as the sample size increases.

## Central Limit Theorem (CLT)
The CLT states that if we have a large enough sample size from any population with a finite mean $\mu\$ and variance $\sigma^2\$, the distribution of the sample mean will tend to follow a normal distribution $N(0,1)$, regardless of the original population distribution.

Mathematically, given a sequence of independent, identically distributed random variables $X_1, X_2, ..., X_n$ with mean $\mu\$ and variance $\sigma^2\$, the standardized sample mean:

$$  Z_n = \frac{\bar{X}_n - \mu}{\sigma / \sqrt{n}}  $$

converges in distribution to $N(0,1)$ as n increases.

## Simulation Details

### 1. Generating Data
- We generate 1000 observations from a chi-square distribution with 5 degrees of freedom.
- A histogram of these observations is plotted along with the chi-square density function.

### 2. Simulation Process
- We simulate 10,000 experiments, each consisting of 1,000 observations from a chi-square distribution.
- The standardized sample mean $Z_j$ is computed for different sample sizes $j$.
- We analyze the distribution of $Z_j$ for various values of $j$ $(3, 5, 10, 100, 500, 1000)$.

### 3. Visualization
- Histograms of $Z_j$ are plotted and compared to the standard normal density function.
- Empirical cumulative distribution functions (ECDF) of $Z_j$ are compared to the theoretical normal CDF.

## Results and Conclusion
- The histograms illustrate that as $j$ increases, the distribution of $Z_j$ approaches the standard normal distribution.
- The ECDF plots confirm that the empirical distribution of $Z_j$ aligns closely with the normal CDF for large $j$.
- This confirms the validity of the Central Limit Theorem.

## Requirements
- R programming language

## Running
To run the simulation, simply execute the provided R script in an R environment. The script will generate all necessary plots and visualizations.



