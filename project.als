
enum Bool { True, False }

one sig Repositorio { clientes: set Cliente }
sig Cliente { projetos: set Projeto }
sig Projeto { ultimoCommit: one Commit }
sig Commit {  }
sig Team {  }
sig BugReport {
  commit: one Commit,
  gravidade: Int,
  resolvido: Bool
} {
  gravidade >= 1 and gravidade <= 3
}
sig DiaTrabalho {
  data: Int,
  reports: set BugReport
} { data > 0 }

fact geral {
  // Todo cliente deve pertencer ao repositório da empresa
  all c: Cliente | c in Repositorio.clientes
  // Todo projeto deve pertencer a um único cliente
  all p: Projeto | one c: Cliente | p in c.projetos
  // Todo commit deve pertencer a um único projeto
  all commit: Commit | one p: Projeto | commit = p.ultimoCommit
  // Um BugReport acontece em um DiaTrabalho
  all bug: BugReport | one dia: DiaTrabalho | bug in dia.reports
  all dia1, dia2: DiaTrabalho | dia1.data != dia2.data
}

/*
fun funcao1 () {

}

fun funcao2 () {

}

fun funcao3 () {

}
*/

/*
pred pred1
pred pred2
pred pred3
pred pred4
pred pred5
*/

assert negativo {
  all dia: DiaTrabalho | #dia.data > 0
}

/*
assert assert2
assert assert3
*/

// pred show() {}

// check negativo
// run show