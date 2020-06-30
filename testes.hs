
-- discollect

discollect [(1,[2,3,4,5]),(6,[7,8,9,10])] = [(1,2),(1,3),(1,4),(1,5),(6,7),(6,8),(6,9),(6,10)]

-- dic_rd 

    -- procurar traduções para uma determinada palavra

        -- exportamos o dicionário com o dic_exp
        -- filtramos os pares com o primeiro elemento igual à palavra pretendida
        -- obtemos uma lista com os segundos elementos
        -- se a lista for vazia retornamos Nothing, caso contrário devolvemos Just lista

        dicio = dic_imp d
        dic_rd "PODRE" dicio = Just ["ROTTEN"]

-- dic_in

    --  inserir palavras novas (palavra e tradução)

        -- passamos o par ((palavra, tradução), dicionário) para ((palavra, [tradução]), dicionário exportado)
        -- passamos o primeiro elemento para uma lista
        -- adicionamos o primeiro elemento ao dicionário exportado
        -- ordenamos por ordem alfabética
        -- importamos o resultado para dicionário

        dicio = dic_imp d
        dic_in "ARROZ" "RICE" dicio = Term "" [Term "A" [Term "B" [Term "A" [Var "BRIM",Term "L" [Term "O" [Var "SHOCK"]]]],Term "M" [Term "I" [Term "G" [Term "O" [Var "FRIEND"]]],Term "O" [Term "R" [Var "LOVE"]]],Term "R" [Term "R" [Term "O" [Term "Z" [Var "RICE"]]]]],Term "M" [Term "E" [Term "D" [Term "O" [Var "FEAR"]]],Term "U" [Term "D" [Term "O" [Var "DUMB",Var "MUTE"]]]],Term "P" [Term "E" [Var "FOOT",Term "D" [Term "R" [Term "A" [Var "STONE"]]]],Term "O" [Term "B" [Term "R" [Term "E" [Var "POOR"]]],Term "D" [Term "R" [Term "E" [Var "ROTTEN"]]]]]]

-- dic_imp

    --  importar dicionários do formato “lista de pares palavra-tradução”

        -- fornecido

            dic_imp d = Term "" [Term "A" [Term "B" [Term "A" [Var "BRIM",Term "L" [Term "O" [Var "SHOCK"]]]],Term "M" [Term "I" [Term "G" [Term "O" [Var "FRIEND"]]],Term "O" [Term "R" [Var "LOVE"]]]],Term "M" [Term "E" [Term "D" [Term "O" [Var "FEAR"]]],Term "U" [Term "D" [Term "O" [Var "DUMB",Var "MUTE"]]]],Term "P" [Term "E" [Var "FOOT",Term "D" [Term "R" [Term "A" [Var "STONE"]]]],Term "O" [Term "B" [Term "R" [Term "E" [Var "POOR"]]],Term "D" [Term "R" [Term "E" [Var "ROTTEN"]]]]]]

-- dic_exp

    -- exportar dicionários para o formato “lista de pares palavra-tradução”

        -- quando só temos uma tradução exportamos com a palavra string vazia e a tradução 

        -- tendo o par (O, lista de listas de pares (O,V)), concatenamos o segundo elemento para ter apenas uma lista de pares
        -- separamos os O's dos V's
        -- nos O's criamos uma lista de pares em que o primeiro elemento é o O de fora e o segundo elemento é cada outro O
        -- percorremos a lista concatenando cada par de O's
        -- no fim obtemos uma lista de O's e outra de V's
        -- para cada O e V criamos um par

            dicio = dic_imp d
            dic_exp dicio = [("ABA",["BRIM"]),("ABALO",["SHOCK"]),("AMIGO",["FRIEND"]),("AMOR",["LOVE"]),("MEDO",["FEAR"]),("MUDO",["DUMB","MUTE"]),("PE",["FOOT"]),("PEDRA",["STONE"]),("POBRE",["POOR"]),("PODRE",["ROTTEN"])]