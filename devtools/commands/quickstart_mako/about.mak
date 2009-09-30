<%inherit file="local:templates.master"/>

<%def name="title()">
Learning TurboGears 2.0: Quick guide to the Quickstart pages.
</%def>

${parent.sidebar_top()}
${parent.sidebar_bottom()}
<div id="getting_started"><%inherit file="tgtest.templates.master"/>

  <h2>Architectural basics of a quickstart TG2 site.</h2>
  <p>The TG2 quickstart command produces this basic TG site.  Here's how it works.</p>
  <ol id="getting_started_steps">
    <li class="getting_started">
      <h3>Code my data model</h3>
      <p> When you want a model for storing favorite links or wiki content, 
          the <strong>/model</strong> folder in your site is ready to go.</p>
      <p> You can build a dynamic site without any data model at all. There 
          still be a default data-model template for you if you didn't enable 
          authentication and authorization in quickstart. If you enabled
          it, you got auth data-model made for you.</p>
    </li>
    <li class="getting_started">
      <h3>Design my URL structure</h3>
      <p> The "<span class="code">root.py</span>" file under the 
          <strong>/controllers</strong> folder has your URLs.  When you 
          called this url (<span class="code"><a href="${tg.url('/about')}">about</a></span>), 
          the command went through the RootController class to the 
          <span class="code">about</span><span class="code">()</span> method.</p>
      <p> Those Python methods are responsible to create the dictionary of
           variables that will be used in your web views (template).</p>
    </li>
    <li class="getting_started">
      <h3>Reuse the web page elements</h3>
      <p> A web page viewed by user could be constructed by single or 
          several reusable templates under <strong>/templates</strong>. 
          Take 'about' page for example, each reusable templates generating 
          a part of the page. We'll cover them in the order of where they are 
          found, listed near the top of the about.html template</p>
      <p> <strong><span class="code">header.html</span></strong> - The 
          "header.html" template contains the HTML code to display the 
          'header': The blue gradient, TG2 logo, and some site text at the 
          top of every page it is included on. When the "about.html" template 
          is called, it includes this "header.html" template (and the others) 
          with a <span class="code">&lt;xi:include /&gt;</span> tag, part of 
          the Genshi templating system. The "header.html" template is not a 
          completely static HTML -- it also dynamically displays the current 
          page name with a Genshi template method called "replace" with the 
          code: <span class="code">&lt;span py:replace="page"/&gt;</span>. 
          It means replace this <span class="code">&lt;span /&gt;</span> 
          region with the contents found in the variable 'page' that has 
          been sent in the dictionary to this "about.html" template, and is 
          available through that namespace for use by this "header.html" 
          template.  That's how it changes in the header depending on what 
          page you are visiting.
      </p>
      <p> <strong><span class="code">sidebars.html</span></strong> - The
           sidebars (navigation areas on the right side of the page) are 
           generated as two separate <span class="code">py:def</span> blocks 
           in the "sidebars.html" template.  The <span class="code">py:def</span> 
           construct is best thought of as a "macro" code... a simple way to 
           separate and reuse common code snippets.  All it takes to include 
           these on the "about.html" page template is to write  
           <span class="code">
    <br/><br/>
    </span> in the page where they are wanted.  CSS styling (in 
    "/public/css/style.css") floats them off to the right side.  You can 
    remove a sidebar or add more of them, and the CSS will place them one 
    atop the other.</p>
        <p>This is, of course, also exactly how the header and footer 
            templates are also displayed in their proper places, but we'll 
            cover that in the "master.html" template below.</p>
        <p>Oh, and in sidebar_top we've added a dynamic menu that shows the 
            link to this page at the top when you're at the "index" page, and 
            shows a link to the Home (index) page when you're here.  Study the 
            "sidebars.html" template to see how we used 
            <span class="code">py:choose</span> for that.</p>
        <p> <strong><span class="code">footer.html</span></strong> - The 
            "footer.html" block is simple, but also utilizes a special 
            "replace" method to set the current YEAR in the footer copyright 
            message. The code is: 
            <span class="code">&lt;span py:replace="now.strftime('%Y')"&gt;
                </span> and it uses the variable "now" that was passed 
            in with the dictionary of variables.  But because "now" is a 
            datetime object, we can use the Python 
            <span class="code">"strftime()"</span> method with the "replace" 
            call to say "Just Display The Year Here".  Simple, elegant; we 
            format the date display in the template (the View in the 
            Model/View/Controller architecture) rather than formatting it in 
            the Controller method and sending it to the template as a string 
            variable.</p>
        <p> <strong><span class="code">master.html</span></strong> - The 
            "master.html" template is called last, by design.  The "master.html" 
            template controls the overall design of the page we're looking at, 
            calling first the "header" py:def macro, then the putting everything 
            from this "about.html" template into the "main_content" div, and 
            then calling the "footer" macro at the end.  Thus the "master.html" 
            template provides the overall architecture for each page in this 
            site.</p>
        <p>But why then shouldn't we call it first?  Isn't it the most 
            important?  Perhaps, but that's precisely why we call it LAST. 
            The "master.html" template needs to know where to find everything 
            else, everything that it will use in py:def macros to build the
             page.  So that means we call the other templates first, and then 
             call "master.html". </p>
        <p>There's more to the "master.html" template... study it to see how 
           the &lt;title&gt; tags and static JS and CSS files are brought into 
           the page.  Templating with Genshi is a powerful tool and we've only 
           scratched the surface.  There are also a few little CSS tricks 
           hidden in these pages, like the use of a "clearingdiv" to make 
           sure that your footer stays below the sidebars and always looks 
           right.  That's not TG2 at work, just CSS.  You'll need all your 
           skills to build a fine web app, but TG2 will make the hard parts 
           easier so that you can concentrate more on good design and content 
           rather than struggling with mechanics.</p>
      </li>
    </ol>
    <p>Good luck with TurboGears 2!</p>
</div
