arch <- c("amd64", "armel", "armhf", "hurd-i386", "i386", "ia64",
	"kfreebsd-amd64", "kfreebsd-i386", "mips", "mipsel", "powerpc",
	"s390", "s390x", "sparc")
palette(c("black", "turquoise", "red", "OrangeRed", "green3", "cyan", 
	"blue", "yellow", "magenta",
	"violetred2","thistle4", "steelblue2", "springgreen4",
	"salmon"))

readdata <- function (file,start) {
	t <- read.table(file,row.names=1,header=FALSE,
	sep=",",col.names=c("date","alpha","at","arm","art","hppa","ht","hurd-i386",
	"hit","i386","it","ia64","i6t","m68k","mt","mips","mit","mipsel","mipt",
	"powerpc","pt","s390","st","amd64","amdt","sparc","spt","armel","aret",
	"kfreebsd-amd64", "kfreebsd-amd64-t", "kfreebsd-i386", "kfreebsd-i386-t",
	"armhf", "armhf-t", "s390x", "s390x-t"))
	ts(as.matrix(data.frame(
	t[23]/t[24]*100, #amd64
	t[27]/t[28]*100, #armel
	t[33]/t[34]*100, #armhf
	t[7]/t[8]*100, #hurd-i386
	t[9]/t[10]*100, #i386
	t[11]/t[12]*100, #ia64
	t[29]/t[30]*100, #kfreebsd-amd64
	t[31]/t[32]*100, #kfreebsd-i386
	t[15]/t[16]*100, #mips
	t[17]/t[18]*100, #mipsel
	t[19]/t[20]*100, #powerpc
	t[21]/t[22]*100, #s390
	t[35]/t[36]*100, #s390x
	t[25]/t[26]*100 #sparc
	)),c(2001,start),frequency=365.25)
}

plotwb <- function (file,title,p,linept=85,height=7.5,width=10,pch=1:18) {
	bitmap(file=file,type="png16m",width=width,height=height,res=64)
	layout(matrix(c(1,1,2,2),2,2),widths=c(0.85,0.15))
	par(mar=c(5,4,4,2)+0.1) 
	par(lab=c(10,10,7))
	plot(p,type="o",plot.type="single",col=1:18,pch=pch,xlab="date",
		ylab="percentage of packages",main=title,cex=2)
	abline(h=90,lty=2,col=3)
	abline(h=linept,lty=2,col=3)
	axis(4)
	plot.new()
	par(plt=c(0,1,0,1))        
	legend(-1.2,1, arch, col=1:18, pch=pch, lwd=2, bg='gray90', cex=1.5)  
}
v <- readdata("/org/wanna-build/etc/graph-data",164)
plotwb("/org/buildd.debian.org/web/stats/graph.png","What percent is built for each architecture",v,85,7.5,10,".")
plotwb("/org/buildd.debian.org/web/stats/graph-big.png","What percent is built for each architecture",v,85,15,20,".")
plotwb("/org/buildd.debian.org/web/stats/graph-week.png","What percent is built for each architecture (past two weeks)",window(v,start=time(v)[length(time(v))-14]),85)
plotwb("/org/buildd.debian.org/web/stats/graph-week-big.png","What percent is built for each architecture (past two weeks)",window(v,start=time(v)[length(time(v))-14]),85,15,20)
plotwb("/org/buildd.debian.org/web/stats/graph-quarter.png","What percent is built for each architecture (past quarter)",window(v,start=time(v)[length(time(v))-90]),85)
plotwb("/org/buildd.debian.org/web/stats/graph-quarter-big.png","What percent is built for each architecture (past quarter)",window(v,start=time(v)[length(time(v))-90]),85,15,20)
v <- readdata("/org/wanna-build/etc/graph2-data",279)
plotwb("/org/buildd.debian.org/web/stats/graph2.png","How architectures are keeping up",v,95,7.5,10,".")
plotwb("/org/buildd.debian.org/web/stats/graph2-big.png","How architectures are keeping up",v,95,15,20,".")
plotwb("/org/buildd.debian.org/web/stats/graph2-week.png","How architectures are keeping up (past two weeks)",window(v,start=time(v)[length(time(v))-14]),95)
plotwb("/org/buildd.debian.org/web/stats/graph2-week-big.png","How architectures are keeping up (past two weeks)",window(v,start=time(v)[length(time(v))-14]),95,15,20)
plotwb("/org/buildd.debian.org/web/stats/graph2-quarter.png","How architectures are keeping up (past quarter)",window(v,start=time(v)[length(time(v))-90]),95)
plotwb("/org/buildd.debian.org/web/stats/graph2-quarter-big.png","How architectures are keeping up (past quarter)",window(v,start=time(v)[length(time(v))-90]),95,15,20)
