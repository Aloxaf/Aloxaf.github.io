#!/bin/zsh
setopt no_unset warn_create_global err_exit pipe_fail extended_glob

local -a passports=(${(ps:\n\n:)"$(<day4.txt)"})

local passport
local -i cnt=0
for passport in $passports; do
  local -A info=(${=${(fs.:.)passport}})
  if [[ ${info[byr]-} == <1920-2002>
          && ${info[iyr]-} == <2010-2020>
          && ${info[eyr]-} == <2020-2030>
          && ${info[hgt]-} == (<150-193>cm|<59-76>in)
          && ${info[hcl]-} =~ '^#[0-9a-f]{6}$'
          && ${info[ecl]-} == (amb|blu|brn|gry|grn|hzl|oth)
          && ${info[pid]-} =~ '^[0-9]{9}$'
      ]]; then
    cnt+=1
  fi
done

print -r -- $cnt
