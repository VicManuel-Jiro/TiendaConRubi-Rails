class PrincipalesController < ApplicationController
  def inicio
  	if params[:nombre].present?
      @productos=Producto.where("nombre LIKE ?", "%" + params[:nombre] + "%").order('id DESC')#.order('id' :desc)#where('nombre LIKE ?', values).all#where(values)#.where('name LIKE ?', '%egm%').all
      @consolas=Consola.where("nombre LIKE ?", "%" + params[:nombre] + "%").order('id DESC')#.order('id' :desc)#where('nombre LIKE ?', values).all#where(values)
      @juegos=Juego.where("titulo LIKE ?", "%" + params[:nombre] + "%").order('id DESC')#.order('id' :desc)#where('titulo LIKE ?', values).all#where(values)
    else
      @productos=Producto.all.order('id DESC')
      @consolas=Consola.all.order('id DESC')
      @juegos=Juego.all.order('id DESC')
    end
  end
end