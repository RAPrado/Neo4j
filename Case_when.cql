case when row.campoData = "." then null else date(row.campoData) end

//ou

case when row.campoData = "" then null else date(row.campoData) end
