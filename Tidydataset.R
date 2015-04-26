##Reading in the data
wdir<-getwd()
subtest<-read.table(paste0(wdir,"/test/subject_test.txt"))
xtest<-read.table(paste0(wdir,"/test/X_test.txt"))
ytest<-read.table(paste0(wdir,"/test/y_test.txt"))
subtrain<-read.table(paste0(wdir,"/train/subject_train.txt"))
xtrain<-read.table(paste0(wdir,"/train/X_train.txt"))
ytrain<-read.table(paste0(wdir,"/train/y_train.txt"))
headers<-read.table(paste0(wdir,"/features.txt"))
acti<-read.table(paste0(wdir,"/activity_labels.txt"))
rm(wdir)

##Condensing groups (Part 1a)
supertest<-cbind(ytest,subtest,xtest)
rm(ytest)
rm(subtest)
rm(xtest)
supertrain<-cbind(ytrain,subtrain,xtrain)
rm(ytrain)
rm(subtrain)
rm(xtrain)

##Condensing to single set (Part 1b)
data<-rbind(supertest,supertrain)
rm(supertest)
rm(supertrain)

##Creating headers (Part 4)
headers<-as.vector(headers[,2])
headers<-c("Activity","Subjects",headers)
colnames(data)<-headers

##Limiting columns to means, standard deviation, and identifiers (Part 2)
headind<-c(1,2,grep("mean",headers),grep("std",headers))
##I have choosen to select any variable with "mean" or "std" in the title. I couldn't find a definitive answer if we needed the more specific subset without "meanFreq", etc.
headind<-sort(headind)
data<-data[,headind]
rm(headind)
rm(headers)

##Creating table of averages (Part 5)
datam<-melt(data,id=c("Subjects","Activity"))
avetab<-dcast(datam,Subjects+Activity~variable,fun.aggregate=mean)
rm(datam)

##Using descriptive activity variables (Part 3)
acti<-as.vector(acti[,2])
actirnamer<-function(x){
if (x==1){
  x<-acti[1]}
else if (x==2){
  x<-acti[2]}
else if (x==3){
  x<-acti[3]}
else if (x==4){
  x<-acti[4]}
else if (x==5){
  x<-acti[5]}
else if (x==6){
  x<-acti[6]}
}
data$Activity<-lapply(data$Activity,actirnamer)
##Removed as it causes problems with the write.table() aspect of the assignment.
##data$avetab$Activity<-lapply(avetab$Activity,actirnamer)
rm(actirnamer)
rm(acti)

