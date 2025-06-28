from dataclasses import asdict

from sphinxawesome_theme import ThemeOptions, __version__
from sphinxawesome_theme.postprocess import Icons

# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'QUCS-S Documentation'
copyright = '2025, The QUCS-S Contributors. Licensed under GNU Free Documentation License v1.3.'
author = 'The QUCS-S Contributors'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'myst_parser',
    #'sphinx-tags',
]

source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown',
}

# MyST Parser Settings
myst_heading_anchors = 5 # I found this to be necessary even when manually specifying header IDs for use in links. See this page: https://myst-parser.readthedocs.io/en/latest/syntax/cross-referencing.html#heading-target

# I've been using non-consecutive heading levels, but MyST really doesn't like that by default. This just suppresses the warnings.
suppress_warnings = ["myst.header"]

templates_path = ['_templates']

# I've often found it useful to include previously-written tutorial content, or developer-only documentation in Markdown format.
# If you do that, it won't show in the table of contents, but Sphinx will (usually) still find the document and include it in search results.
# This can be very confusing for users, obviously.
# I'm choosing to get around this by changing the extension of "non public-facing" files to .exclude.md or .exclude.rst.
# This setting just makes Sphinx respect that (at all levels of the folder hierarchy).
exclude_patterns = ['**/*.exclude.md', '**/*.exclude.rst']

# This makes the EPUB output show all the URLs as footnotes, rather than directly inline where they're referenced.
# Cuts down on clutter factor.
epub_show_urls = 'footnote'



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_title = project # This keeps the site from saying "QUCS-S Documentation documentation" as a title
html_theme = 'sphinxawesome_theme'
html_static_path = [ ]
# html_static_path = ['_static']

theme_options = ThemeOptions(
    show_prev_next=True,
    awesome_external_links=True,
    main_nav_links={"Docs": "https://qucs-s-help.readthedocs.io", "Main QUCS-S Site": "https://ra3xdh.github.io/", "Forum": "https://github.com/ra3xdh/qucs_s/discussions"},
    extra_header_link_icons={
        "repository on GitHub": {
            "link": "https://github.com/ra3xdh/qucs_s-help",
            "icon": (
                '<svg height="26px" style="margin-top:-2px;display:inline" '
                'viewBox="0 0 45 44" '
                'fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
                '<path fill-rule="evenodd" clip-rule="evenodd" '
                'd="M22.477.927C10.485.927.76 10.65.76 22.647c0 9.596 6.223 17.736 '
                "14.853 20.608 1.087.2 1.483-.47 1.483-1.047 "
                "0-.516-.019-1.881-.03-3.693-6.04 "
                "1.312-7.315-2.912-7.315-2.912-.988-2.51-2.412-3.178-2.412-3.178-1.972-1.346.149-1.32.149-1.32 "  # noqa
                "2.18.154 3.327 2.24 3.327 2.24 1.937 3.318 5.084 2.36 6.321 "
                "1.803.197-1.403.759-2.36 "
                "1.379-2.903-4.823-.548-9.894-2.412-9.894-10.734 "
                "0-2.37.847-4.31 2.236-5.828-.224-.55-.969-2.759.214-5.748 0 0 "
                "1.822-.584 5.972 2.226 "
                "1.732-.482 3.59-.722 5.437-.732 1.845.01 3.703.25 5.437.732 "
                "4.147-2.81 5.967-2.226 "
                "5.967-2.226 1.185 2.99.44 5.198.217 5.748 1.392 1.517 2.232 3.457 "
                "2.232 5.828 0 "
                "8.344-5.078 10.18-9.916 10.717.779.67 1.474 1.996 1.474 4.021 0 "
                "2.904-.027 5.247-.027 "
                "5.96 0 .58.392 1.256 1.493 1.044C37.981 40.375 44.2 32.24 44.2 "
                '22.647c0-11.996-9.726-21.72-21.722-21.72" '
                'fill="currentColor"/></svg>'
            ),
        },
    },
)

html_theme_options = asdict(theme_options)
