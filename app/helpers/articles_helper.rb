module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

  def build_feed(articles, http_host)
    full_host = "http://" + http_host.gsub(/(^http:\/\/|\/$)/, '')

    builder = Nokogiri::XML::Builder.new do |xml|
      xml.feed :xmlns => 'http://www.w3.org/2005/Atom' do

        xml.title   "Recent Articles"
        xml.updated articles.last.created_at.iso8601
        xml.link    :rel => "self", :href => full_host+'/articles.atom'
        xml.id      full_host + '/'

        xml.author do |author|
          author.name   "Many Authors"
          author.email  "contact@example.com"
          author.uri    full_host
        end

        articles.each do |article|
          xml.entry do |entry|
            entry.id          full_host + article.to_param
            entry.title       article.title
            entry.published   article.created_at.iso8601
            entry.updated     article.created_at.iso8601
            entry.summary     article.title
            entry.link        :href => full_host + article.to_param
            entry.content     article.body, :type => 'html'
          end
        end
      end
    end

    builder.to_xml
  end
end
