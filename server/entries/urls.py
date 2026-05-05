from django.urls import path
from .views.filter_board import filter_board
from .views.entries import entries
from .views.entry_detail import entry_detail
from .views.entry_feedback import entry_feedback

urlpatterns = [
    path("v1/filter-board", filter_board),
    path("v1/entries", entries),
    path("v1/entry-detail", entry_detail),
    path("v1/entry-feedback", entry_feedback),
]
