Seq <- c(1,6,83,686,6621)
Thr <- c(3,6,155,898,7279)
Work <- c(5,100,800,2500,8000)

Rng <- range(0, Seq, Thr)

plot(Work, Seq, type="b", pch=19, col="red", ylim=Rng, xlab="Work", ylab="Times")
lines(Work, Thr, type="b", pch=18, col="blue", lty=2)
legend(100, 5000, legend=c("Sequential", "Threaded"), col=c("red", "blue"), lty=1:2, cex=1)

title(main="Suma de atrices", col.main="black", font.main=4)