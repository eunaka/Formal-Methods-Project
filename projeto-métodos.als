//Projetos -> Possui uma pasta a qual o Projeto pertence
sig Project{
	projectFolder: one Folder	
}

//Códigos que estão nas pastas
sig Code{}

//Pasta -> Possui um conjunto de versões de um código
sig Folder{
	versions: set codeVersions
}

//Versões de um código
sig versionDate{}
sig codeVersions extends Code{
	versions: set Code,
	//Relação que liga versões a apenas uma data 
	codeDate: (versions -> one versionDate) 
}

//Um cliente possui um ou mais projetos em andamento
sig Cliente{
	workingProjects: set Project
}{
	//Precisa ter um ou mais projetos, necessariamente
	#(workingProjects) > 0
}

//Descrição e Gravidades
sig descript{}
sig gravity{}
sig grav1, grav2, grav3 extends gravidade{}

//Bug -> Possui uma descrição e uma gravidade
sig Bug{
	description: one descript,
	gravity: one gravity
}

//Dia de trabalho -> Possui o projeto selecionado, o cliente selecionado, os bugs achados
sig workDay{
	selectedProject: one Project,
	selectedClient: one Client,
	bugsFound: set Bug,
	bugsCorrected: set Bug
}


         /*                                               Funções que refletem o comportamento do Sistema                                          */

//Adiciona um projeto no conjunto de projetos selecionados de um workDay
fun selectProject(w, w': workDay, p:Project){
	w'.selectedProject = w.selectedProject + p
}

//Adiciona um bug no conjunto de bugs achados de um workDay
fun reportBug(w, w':workDay, b:Bug, d:descript, g:gravity){
	b.gravity = g and
	b.descript = d and
	w'.bugsFound = w.bugsFound + b
}

fun correctBug{
	
}

