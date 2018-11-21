
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
  reports: set BugReport,
  projeto: one Projeto
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
  // Em um dia, todo bug deve pertencer a um único projeto
  all bug: BugReport
    | one dia: DiaTrabalho
    | bug in dia.reports
      and bug.commit = dia.projeto.ultimoCommit
  // Dias têm datas diferentes
  all disj dia1, dia2: DiaTrabalho | dia1.data != dia2.data
  // Dias têm chekcs de clientes diferentes
  all disj dia1, dia2: DiaTrabalho | no c: Cliente | dia1.projeto in c.projetos and dia2.projeto in c.projetos
}

fun cehckBugResolvido (bug: BugReport): Bool {
  bug.resolvido
}

/*
fun projetoByCommit (commit: Commit) : Projeto {
  let p = one Projeto | commit.~(p.ultimoCommit)
}
*/

/*
fun funcao3 () {

}
*/


pred addBug (dia: DiaTrabalho, bug: BugReport) {
  dia.reports = dia.reports + bug
}

pred addProjeto (dia: DiaTrabalho, p: Projeto) {
  dia.projeto = p
}

pred criaDia (dia: DiaTrabalho, p: Projeto, bug: BugReport) {
  addProjeto[dia, p] and addBug[dia, bug]
}

pred resolveBug (bug: BugReport) {
  bug.resolvido = True
}
/*
pred pred5
*/

assert negativo {
  all dia: DiaTrabalho | #dia.data > 0
}
check negativo

assert diasConsecutivos {
  all c: Cliente
    | no disj dia1, dia2: DiaTrabalho
    | dia1.projeto in c.projetos and dia2.projeto in c.projetos
}
check diasConsecutivos

assert bugDoProjeto {
  all p: Projeto, bug: BugReport, dia: DiaTrabalho
  | criaDia[dia, p, bug] implies p.ultimoCommit = bug.commit
}
check bugDoProjeto


// pred show() {}

// run show