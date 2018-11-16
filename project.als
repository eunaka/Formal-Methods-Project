
one sig Repositorio { clientes: set Cliente }
sig Cliente { projetos: set Projeto }
sig Projeto { commits: set Commit }
sig Commit { version: Int } { version > 0 }
sig Team {  }
sig BugReport {
  commit: one Commit,
  gravidade: Int
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
  all cm: Commit | one p: Projeto | cm in p.commits
}

assert negativo {
  all dia: DiaTrabalho | #dia.data > 0
  all c: Commit | #c.version > 0
}


// pred show() {}

// check negativo
// run show