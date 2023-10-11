from django.contrib import messages
from django.shortcuts import  render, redirect
from django.core.files.storage import default_storage
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.db.models.fields.files import FieldFile
from django.views.generic import FormView
from django.views.generic.base import TemplateView

from django.contrib.auth import login, authenticate #add this
from django.contrib.auth.forms import AuthenticationForm #add this
from app.forms import ContactForm, ContactFormSet, FilesForm

from .forms import NewUserForm

# http://yuji.wordpress.com/2013/01/30/django-form-field-in-initial-data-requires-a-fieldfile-instance/
class FakeField(object):
    storage = default_storage


fieldfile = FieldFile(None, FakeField, "dummy.txt")


def home(request):
    
    
    if request.method == "POST":
        if request.POST.get('submit') == 'signup':
            form1 = NewUserForm(request.POST)
            if form1.is_valid():
                user = form1.save()
                login(request, user)
                messages.success(request, "Registration successful.")
            messages.error(request, "Unsuccessful registration. Invalid information.")
        elif request.POST.get('submit') == 'signin':
            form2 = AuthenticationForm(request, data=request.POST)
            if form2.is_valid():
                username = form2.cleaned_data.get('username')
                password = form2.cleaned_data.get('password')
                user = authenticate(username=username, password=password)
                if user is not None:
                    login(request, user)
                    messages.info(request, f"You are now logged in as {username}.")
                else:
                    messages.error(request,"Invalid username or password.")
            else:
                messages.error(request,"Invalid username or password.")
    form1 = NewUserForm()
    form2 = AuthenticationForm()


    return render (request=request, template_name="home.html", context={"register_form":form1,"login_form":form2})
    

class DefaultSignUpView(FormView):
    template_name = "app/signUp.html"
    form_class = ContactFormSet


class DefaultLogInView(FormView):
    template_name = "app/logIn.html"
    form_class = ContactForm


class DefaultFeedbackView(FormView):
    template_name = "app/feedback.html"
    form_class = ContactForm


class FormHorizontalView(FormView):
    template_name = "app/form_horizontal.html"
    form_class = ContactForm


class FormInlineView(FormView):
    template_name = "app/form_inline.html"
    form_class = ContactForm


class FormWithFilesView(FormView):
    template_name = "app/form_with_files.html"
    form_class = FilesForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["layout"] = self.request.GET.get("layout", "vertical")
        return context

    def get_initial(self):
        return {"file4": fieldfile}


class PaginationView(TemplateView):
    template_name = "app/pagination.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        lines = []
        for i in range(200):
            lines.append("Line %s" % (i + 1))
        paginator = Paginator(lines, 10)
        page = self.request.GET.get("page")
        try:
            show_lines = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            show_lines = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            show_lines = paginator.page(paginator.num_pages)
        context["lines"] = show_lines
        return context


class MiscView(TemplateView):
    template_name = "app/misc.html"
class GDPRView(TemplateView):
    template_name = "app/gdpr.html"
