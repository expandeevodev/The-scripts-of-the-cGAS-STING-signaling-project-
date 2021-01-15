library("edgeR")
in=read.table("expresion_table.txt",header=T)
data=in[,-1]
rownames(data)=in[,1]
group <- factor(c(1,1,2,2)) # 1 for treatment, 2 for mock control
data <- DGEList(counts = data, group = group)
data <- calcNormFactors(data)
cpm(data)->normalized
design <- model.matrix(~group)
data <- estimateDisp(data, design)
fit <- glmQLFit(data, design)
qlf <- glmQLFTest(fit, coef=2)
topTags(qlf,dim(a)[1])->result
write.table(result$table,"add_FDR.txt",sep="\t",quote=F)

