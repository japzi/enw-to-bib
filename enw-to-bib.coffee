convert_enw_to_bib = (enw) ->
    entries = enw.split("\n")
    author = ""
    title = ""
    journal = ""
    year = ""
    number = ""
    pages = ""
    volume = ""

    doi = ""
    url = ""

    identifier = ""

    for entry in entries
        if entry.startsWith("%T ")
            title = entry.slice(3)
        else if entry.startsWith("%J ")
            journal = entry.slice(3)
        else if entry.startsWith("%V ")
            volume = entry.slice(3)
        else if entry.startsWith("%A ")
            author += entry.slice(3) + ";"
            identifier = entry.slice(3).split(",")[0] if identifier is ""
        else if entry.startsWith("%R ")
            doi = entry.slice(3)
        else if entry.startsWith("%D ")
            year = entry.slice(3)
        else if entry.startsWith("%U ")
            url = entry.slice(3)
        else if entry.startsWith("%P ")
            pages = entry.slice(3)

    identifier += year
    
    bib = "@Article{#{identifier},\n
     Title = {#{title}},\n
     Author = {#{author}},\n
     Journal = {#{journal}},\n
     year = {#{year}},\n
     volume = {#{volume}},\n
     doi = {#{doi}},\n
     url = {#{url}},\n}"
    bib
    