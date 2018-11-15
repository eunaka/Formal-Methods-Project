abstract sig Bool{}
one sig True extends Bool
one sig False extends Bool

//Projetos -> Possui uma pasta a qual o Projeto pertence
sig Project{
	projectFolder: one Folder	
}

//Conjunto de dias
sig Time{}

//Códigos que estão nas pastas
sig Code{}

//Pasta -> Possui um conjunto de versões de um código
sig Folder{
	lastVersion: one codeVersion
}

//Versões de um código
sig versionDate{}
sig codeVersion extends Code{
	versions: set Code,
	//Relação que liga versões a apenas uma data 
	codeDate: seq versionDate   
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
	gravity: one gravidade,
	days: seq Time
}{
	gravity in gravidade
	#(days) <= 5 and #(days) > 0
}

//Dia de trabalho -> Possui o projeto selecionado, o cliente selecionado, os bugs achados
sig workDay{
	selectedProject: one Project,
	selectedClient: one Client,
	bugsFound: set Bug,
	bugsCorrected: set Bug,
	day: one Time
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

//Corrige um bug do conjunto de bugs selecionados em um workDay
fun correctBug(b: Bug, w w':workDay){
	w'.bugsCorrected = w.bugsCorrected + b
}

/*                                                          Predicados sobre o Sistema                                                       */

//Predicado para rodar e observar as instâncias do modelo
pred show{}

//Existem apenas grav1, grav2 e grav3 em Gravity
pred gravityRestrict(b:Bug){
	no b | (b.gravity not in grav1) or (b.gravity not in grav2) or (b.gravity not in grav3)
}


