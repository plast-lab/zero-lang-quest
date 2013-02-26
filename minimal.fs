﻿open System
[<EntryPoint>]
let main args = 
    let p = 
        Seq.takeWhile ((<>) "") (seq { while (true) do yield Console.ReadLine() }) 
        |> Seq.toList 
        |> List.map (fun l -> let ab= l.Split([|'|'|]) in (int ab.[0], int ab.[1])) 

    let lkp = 
        p 
        |> Seq.groupBy snd 
        |> Seq.map (fun (a,b) -> (a, (b |> Set.ofSeq |> Set.count)> int args.[0]))
        |> Map.ofSeq 
           
    p |> List.iter (fun (a, b) -> if lkp.[b] then printfn "%d|%d" a b)

    0
