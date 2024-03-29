<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform' >
<xsl:output method='html' version='1.0' encoding='UTF-8' indent='yes' />
<xsl:param name="show-images" select="true" />
<xsl:param name="category" select="''" />
<xsl:param name="selector-mode" select="'all'" />
  <xsl:template match="/">
    <table>
			<caption>Книги на избавление: <xsl:value-of select="$category" />. Selector mode: <xsl:value-of select="$selector-mode" /></caption>
      <thead>
				<tr>
		<xsl:if test="$show-images">
					<th>Изображение</th>
		</xsl:if>
					<th>Название</th>
					<th>Автор</th>
					<th>Издательство</th>
					<th>Город</th>
					<th>Год</th>
					<th>Описание</th>
					<th>Количество страниц</th>
					<th>Состояние</th>
				</tr>
      </thead>
      <tbody>
		<xsl:choose>
			<xsl:when test="$selector-mode='all'">
				<xsl:apply-templates select="books/book" />
			</xsl:when>
			<xsl:when test="$selector-mode='category'">
				<xsl:apply-templates select="books/book[@category=$category]" />
			</xsl:when>
			<xsl:when test="$selector-mode='undef'">
				<xsl:apply-templates select="books/book[not(@category)]" />
			</xsl:when>
		</xsl:choose>
      </tbody>
    </table>
  </xsl:template>

	<xsl:template match="book">
		<tr>
		<xsl:if test="$show-images">
			<td class="image"><xsl:apply-templates select="image" /></td>
		</xsl:if>
			<td class="name"><xsl:apply-templates select="name" /></td>
			<td><xsl:apply-templates select="author" /></td>
			<td><xsl:apply-templates select="publisher" /></td>
			<td><xsl:apply-templates select="city" /></td>
			<td><xsl:apply-templates select="year" /></td>
			<td class="descr"><xsl:apply-templates select="description" /></td>
			<td><xsl:apply-templates select="pagenum" /></td>
			<td><xsl:apply-templates select="condition" /></td>
		</tr>
	</xsl:template>

<xsl:template match="image">
  <a><xsl:attribute name="href">data/images/<xsl:value-of select="." /></xsl:attribute><img><xsl:attribute name="src">data/thumbnails/thumb-<xsl:value-of select="." /></xsl:attribute></img></a>
</xsl:template>

<xsl:template match="name | author | publisher | city | pagenum | condition | year | description">
  <xsl:value-of select="." />
</xsl:template>

</xsl:stylesheet>
