syn match javaOperator "%\|\^\|&\|*\|-\|+\|=\||\|<\|>\|?\|:\|!\|\~\|[^/*]\zs\/\ze[^/*]"
syn keyword javaType new
syn keyword javaImport import
hi link javaImport Include
syn region  javaComment		 start="/\*"  end="\*/" contains=@javaCommentSpecial,javaTodo,@Spell
