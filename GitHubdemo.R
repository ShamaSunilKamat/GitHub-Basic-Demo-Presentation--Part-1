#volcano eruption
#https://data.world/makeovermonday/2018w28-volcano-eruptions
#install.packages("gdata")
file <- file.choose()
df<- read.csv(file=file, sep= ',' , header = TRUE, stringsAsFactors = FALSE)
View(df)

#single dimension plot
volcanofreq<-data.frame(table(df$Region))
colnames(volcanofreq)<-c("Region","Frequency")
volcanofreq
sortde<-volcanofreq[order(-volcanofreq$Frequency),]
label= (sortde$Region[1:6])
#label2=sortde$Frequency[1:6]
pie(sortde$Frequency[1:6], labels = (label),main = "Top 6 Volcanic-prone Regions")

#multi-dimensional plot
volctype<-df1[df1$Country=="Tonga" | df1$Country=="Canada",c('Country','Primary.Volcano.Type')]
forgraph<-table(volctype$Country,volctype$Primary.Volcano.Type)
#colnames(forgraph)=c("Volcano Type","Country","Freq")
str(forgraph)
#stacked bar chart
barplot(forgraph,col = c("orange","red"), cex.names = 0.5, xlab = "Volcano Types", ylab = "Number of Occurences "
        ,ylim=c(0,20),main = "Ocuurences of Volcano types", legend.text = c("Canada","Tonga"), args.legend = list(x="topleft", bty='n'))
#besides bar chart
barplot(forgraph,col = c("orange","red"), beside = TRUE, cex.names = 0.5,xlab = "Volcano Types", ylab = "Number of Occurences "
        ,ylim=c(0,14),main = "Ocuurences of Volcano types", legend.text = c("Canada","Tonga"), args.legend = list(x="topleft", bty='n'))


#six graphs 
filteredvolcano<-volcano[volcano$Country=="United States"|volcano$Country=="Canada"| volcano$Country=="Japan",]
View(filteredvolcano)

xyz<-table(filteredvolcano$Primary.Volcano.Type,filteredvolcano$Country)
xyz1<-data.frame(xyz)
View(xyz1)

toplot<-xyz1[xyz1$Var1=="Caldera"|xyz1$Var1=="Complex"|xyz1$Var1=="Pyroclastic cone(s)"| xyz1$Var1=="Shield"| xyz1$Var1=="Stratovolcano"| xyz1$Var1=="Submarine",]

View(toplot)
colnames(toplot)<-c("Volcano Type","Country","No of occurences")
par(mfrow=c(2,3))

#firstquad
one<-toplot[toplot$`Volcano Type`=="Caldera",]
barplot(one$`No of occurences`, main = "Caledra Volcano",
        xlab = "Country", ylab = "No of occurence",
        col = c("Red","Blue","pink"))

#secondquad
two<-toplot[toplot$`Volcano Type`=="Complex",]
barplot(two$`No of occurences`, main = "Complex Volcano",
        xlab = "Country", ylab = "No of occurence",
        col = c("Red","Blue","pink"))

#third
three<-toplot[toplot$`Volcano Type`=="Pyroclastic cone(s)",]
barplot(three$`No of occurences`, main = "Pyroclastic cone Volcano",
        xlab = "Country", ylab = "No of occurence", 
        legend.text = c("Canada", "Japan","US"),
        col = c("Red","Blue","pink"))

#fourth
four<-toplot[toplot$`Volcano Type`=="Shield",]
barplot(four$`No of occurences`, main = "Shield Volcano",
        xlab = "Country", ylab = "No of occurence",
        col = c("Red","Blue","pink"))


#fifth
five<-toplot[toplot$`Volcano Type`=="Stratovolcano",]
barplot(five$`No of occurences`, main = "Stratovolcano",
        xlab = "Country", ylab = "No of occurence",
        col = c("Red","Blue","pink"))

#sixth
six<-toplot[toplot$`Volcano Type`=="Submarine",]
barplot(six$`No of occurences`, main = "Submarine Volcano",
        xlab = "Country", ylab = "No of occurence",
        col = c("Red","Blue","pink"))