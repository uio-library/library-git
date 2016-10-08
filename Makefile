<<<<<<< HEAD
# Settings
MAKEFILES=Makefile $(wildcard *.mk)
JEKYLL=jekyll
DST=_site

# Source files in the order they appear in the navigation menu.
# This does _not_ include files which are typically unmodified.
SRC_FILES = \
=======
## ========================================
## Commands for both workshop and lesson websites.

# Settings
MAKEFILES=Makefile $(wildcard *.mk)
JEKYLL=jekyll
PARSER=bin/markdown_ast.rb
DST=_site

# Controls
.PHONY : commands clean files
all : commands

## commands         : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILES} | sed -e 's/## //g'

## serve            : run a local server.
serve : lesson-rmd
	${JEKYLL} serve

## site             : build files but do not run a server.
site : lesson-rmd
	${JEKYLL} build

# repo-check        : check repository settings.
repo-check :
	@bin/repo_check.py -s .

## clean            : clean up junk files.
clean :
	@rm -rf ${DST}
	@rm -rf .sass-cache
	@rm -rf bin/__pycache__
	@find . -name .DS_Store -exec rm {} \;
	@find . -name '*~' -exec rm {} \;
	@find . -name '*.pyc' -exec rm {} \;

## clean-rmd        : clean intermediate R files (that need to be committed to the repo).
clear-rmd :
	@rm -rf ${RMD_DST}
	@rm -rf fig/rmd-*

## ----------------------------------------
## Commands specific to workshop websites.

.PHONY : workshop-check

## workshop-check   : check workshop homepage.
workshop-check :
	@bin/workshop_check.py .

## ----------------------------------------
## Commands specific to lesson websites.

.PHONY : lesson-check lesson-rmd lesson-files lesson-fixme

# RMarkdown files
RMD_SRC = $(wildcard _episodes_rmd/??-*.Rmd)
RMD_DST = $(patsubst _episodes_rmd/%.Rmd,_episodes/%.md,$(RMD_SRC))

# Lesson source files in the order they appear in the navigation menu.
MARKDOWN_SRC = \
>>>>>>> 7f8e13d704e49b625b25b7b655d4c21db70c7ccf
  index.md \
  CONDUCT.md \
  setup.md \
  $(wildcard _episodes/*.md) \
  reference.md \
  $(wildcard _extras/*.md) \
  LICENSE.md

<<<<<<< HEAD
# Generated files in the order they appear in the navigation menu.
HTML_FILES = \
=======
# Generated lesson files in the order they appear in the navigation menu.
HTML_DST = \
>>>>>>> 7f8e13d704e49b625b25b7b655d4c21db70c7ccf
  ${DST}/index.html \
  ${DST}/conduct/index.html \
  ${DST}/setup/index.html \
  $(patsubst _episodes/%.md,${DST}/%/index.html,$(wildcard _episodes/*.md)) \
  ${DST}/reference/index.html \
  $(patsubst _extras/%.md,${DST}/%/index.html,$(wildcard _extras/*.md)) \
  ${DST}/license/index.html

<<<<<<< HEAD
# Controls
.PHONY : commands clean files singlepage
all : commands

## commands   : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILES} | sed -e 's/## //g'

## serve      : run a local server.
serve :
	${JEKYLL} serve --config _config.yml,_config_dev.yml

## site       : build files but do not run a server.
site :
	${JEKYLL} build --config _config.yml,_config_dev.yml

## clean      : clean up junk files.
clean :
	@rm -rf ${DST}
	@rm -rf .sass-cache
	@find . -name .DS_Store -exec rm {} \;
	@find . -name '*~' -exec rm {} \;
	@find . -name '*.pyc' -exec rm {} \;

## files      : show expected names of generated files for debugging.
files :
	@echo 'source:' ${SRC_FILES}
	@echo 'generated:' ${HTML_FILES}

## fixme      : show FIXME markers embedded in source files.
fixme :
	@fgrep -i -n FIXME ${SRC_FILES} || true

## singlepage : build hacky single-page version of material (after 'make site').
singlepage :
	bin/jekyllcat -o '</nav>' -c '<footer' ${HTML_FILES} > _site/singlepage.html

# Include extra commands if available.
=======
## lesson-rmd       : convert Rmarkdown files to markdown
lesson-rmd: $(RMD_SRC)
	@bin/knit_lessons.sh $(RMD_SRC)

## lesson-check     : validate lesson Markdown.
lesson-check :
	@bin/lesson_check.py -s . -p ${PARSER}

## lesson-check-all : validate lesson Markdown, checking line lengths and trailing whitespace.
lesson-check-all :
	@bin/lesson_check.py -s . -p ${PARSER} -l -w

## lesson-figures   : re-generate inclusion displaying all figures.
lesson-figures :
	@bin/extract_figures.py -p ${PARSER} ${MARKDOWN_SRC} > _includes/all_figures.html

## unittest         : run unit tests on checking tools.
unittest :
	python bin/test_lesson_check.py

## lesson-files     : show expected names of generated files for debugging.
lesson-files :
	@echo 'RMD_SRC:' ${RMD_SRC}
	@echo 'RMD_DST:' ${RMD_DST}
	@echo 'MARKDOWN_SRC:' ${MARKDOWN_SRC}
	@echo 'HTML_DST:' ${HTML_DST}

## lesson-fixme     : show FIXME markers embedded in source files.
lesson-fixme :
	@fgrep -i -n FIXME ${MARKDOWN_SRC} || true

#-------------------------------------------------------------------------------
# Include extra commands if available.
#-------------------------------------------------------------------------------

>>>>>>> 7f8e13d704e49b625b25b7b655d4c21db70c7ccf
-include commands.mk
