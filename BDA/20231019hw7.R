#第九章習題
#實作題
#3,4,5,6

#7. 搜尋 state.name ，列出包含"M" 或 "m"，後面接"i"或"a"的州。 
#8. 搜尋 state.name ，列出包含至少兩個連續的 "s" 或兩個連續的 "n" 的州。


#3. 搜尋 state.name 數據集中，字串含 "South" 的州。
south_states <- state.name[grep("South", state.name)]
south_states

#4. 搜尋 state.name 數據集中，將字串含 "M"，改成 "m"。
state.name_modified <- gsub("M", "m", state.name)
state.name_modified

#5. 搜尋 state.name 數據集中，只列出含一個單字的州。

#single_word_states <- state.name[grep("^\\w+$", state.name)]
single_word_states <- state.name[grep("^[A-Za-z]+$", state.name)]
single_word_states

#6. 搜尋 state.name 數據集中，列出含 "A" 和 "M" 的州。
am_states <- state.name[grep("A.*M|M.*A", state.name, ignore.case = TRUE)]
am_states

#7. 搜尋 state.name ，列出包含"M" 或 "m"，後面接"i"或"a"的州。 
mi_ma_states <- state.name[grep("[Mm][i|a]", state.name)]
mi_ma_states

#8. 搜尋 state.name ，列出包含至少兩個連續的 "s" 或兩個連續的 "n" 的州。
double_s_or_n_states <- state.name[grep("ss|nn", state.name)]
double_s_or_n_states