









NESSA CHALLENGE, DEVEMOS EXTRAIR OS 
5 ÚLTIMOS CARACTERES 

DOS EMAIL ADDRESSES....












SEGUNDA TASK:


2) GARANTA QUE O EMAIL ADDRESS SEMPRE ACABE 

COM '.org'...







3) POR FIM,

DE ALGUMA FORMA CONSIGA EXTRAIR APENAS 

O '.' LÁ DOS EMAIL ADDRESSES...













CERTO... TENTAMOS FAZER ISSO...








SELECT
RIGHT(email, 5) as last_char
FROM customer
WHERE RIGHT(email, 4) = '.org';










PARA RESOLVER A 3, ESCREVEMOS:







SELECT
RIGHT(LEFT(RIGHT(email, 5), 2), 1) as last_chars
FROM customer
WHERE RIGHT(email, 4) = '.org';













OK, ISSO REALMENTE ME RETORNOU APENAS O '.'


EM CADA ROW...















PRIMEIRO O OUTPUT FICOU ASSIM:






r.org








DEPOIS FICOU ASSIM:





. 












--> CONSEGUI...











A SOLUCAO FICOU ASSIM:










SELECT
email,
RIGHT(email, 5)
FROM customer;














OK, MAS COMO PODEMOS FAZER O EXTRACT DO "." 


EM 

"r.org"...













--> PODEMOS FAZER DO LADO RIGHT,


MAS 


SERIA COMPLICADO(pq os names sempre possuem diferentes 
lenghts)..















-> POR ISSO COMECAMOS COM O NEST DO RIGHT DENTRO DO LEFT:












SELECT 
    email,
    LEFT(RIGHT(email, 4), 1)
FROM customer;








CERTO....







MAS AGORA O QUE ACONTECE SE __ QUISERMOS EXTRAIR APENAS

AS INIITIALS 



DE STRINGS, E ENTAO AS JUNTAR (

    com LEFT/RIGHT e CONCAT...
)