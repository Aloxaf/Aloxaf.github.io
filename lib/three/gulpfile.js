const fs=require("fs"),del=require("del"),gulp=require("gulp"),concat=require("gulp-concat"),uglify=require("gulp-uglify");gulp.task("clean",()=>{del(["*.min.js","!three.min.js"])}),gulp.task("scripts",()=>{fs.readdirSync("src").forEach(e=>{const s=e.split(".")[0];return gulp.src([`src/${s}.js`,"lib/*.js"]).pipe(concat(`${s}.min.js`)).pipe(uglify()).pipe(gulp.dest("./"))})}),gulp.task("default",["clean","scripts"]);