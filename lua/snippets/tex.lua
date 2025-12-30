local ls = require("luasnip")

local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local t = ls.text_node
local i = ls.insert_node

local extras = require("luasnip.extras")
local rep = extras.rep

require("luasnip").add_snippets("tex", {
	s("\\begin", fmta([[
		\begin{<>}
		<>
		\end{<>}]],
		{i(1), i(0), rep(1)}, -- repeat node 1
		{delimeters='<>'}
	)),
	s("\\align", fmta([[
		\begin{align*}
			<>
		\end{align*}]],
		{i(0)}, -- repeat node 1
		{delimeters='<>'}
	)),
	s("\\pmatrix", fmta([[
		\begin{pmatrix}
			<>
		\end{pmatrix}]],
		{i(0)}, -- repeat node 1
		{delimeters='<>'}
	)),
	s("\\subsec", { t("\\subsection*{"), i(0), t("}")}),
	s("\\sec", { t("\\section*{"), i(0), t("}")}),
	s("\\frac", { t("\\frac{"), i(1), t("}{"), i(0), t("}")}),
})
