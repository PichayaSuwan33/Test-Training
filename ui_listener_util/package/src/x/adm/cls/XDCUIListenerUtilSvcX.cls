&ANALYZE-SUSPEND _VERSION-NUMBER UIB_v8r2 GUI
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DECLARATIONS V-table-Win 

/* _UIB-CODE-BLOCK-END */ 
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _XFTR "Update Information" Procedure _INLINE
/* Actions: ? ? ? ? adm/support/proc/ds_pa_01.w */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS Procedure
/******************************************************************************/
/* @COPYRIGHT@                                                                */
/* Project: proALPHA                                                          */
/*                                                                            */
/* Name   : XDCUIListenerUtilSvcX.cls                                         */
/* Product: X - Individualanpassungen extern                                  */
/* Module : ADM - Basiskomponenten                                            */
/*                                                                            */
/* Created: 9.3.0 as of 04.04.2024/Suwan_P                                    */
/* Current: @PAVERSION@ as of @PADATE@/@PALASTAUTHOR@                         */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/* DESCRIPTION                                                                */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/* Custom Class for XDCUIListenerUtilSvc                                      */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/* PARAMETERS                                                                 */
/*----------------------------------------------------------------------------*/
/* Name                      Description                                      */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*----------------------------------------------------------------------------*/
/* HISTORY                                                                    */
/*----------------------------------------------------------------------------*/
/* @FILEHISTORY@                                                              */
/******************************************************************************/

/* Procedure Information -----------------------------------------------------*/

&GLOBAL-DEFINE pa-Autor            Suwan_P
&GLOBAL-DEFINE pa-Version          @PAVERSION@
&GLOBAL-DEFINE pa-Datum            @PADATE@
&GLOBAL-DEFINE pa-Letzter          @PALASTAUTHOR@

&GLOBAL-DEFINE pa-GenVersion       OEA
&GLOBAL-DEFINE pa-ProgrammTyp      Class
&GLOBAL-DEFINE pa-Template         paooablstdclass.clsjet
&GLOBAL-DEFINE pa-TemplateVersion  1.00
&GLOBAL-DEFINE pa-XBasisName       XDCUIListenerUtilSvcX_cls
&GLOBAL-DEFINE pa-NameSpace        1.00

/*----------------------------------------------------------------------------*/
/* Definitions (Preprocessor only)                                            */
/*----------------------------------------------------------------------------*/

/* Globals -------------------------------------------------------------------*/

{adm/template/incl/dt_cls00.df}

/* SCOPEDs -------------------------------------------------------------------*/


/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Procedure


/* ***************************  Main Block  *************************** */

/*----------------------------------------------------------------------------*/
/* Class Definition                                                           */
/*----------------------------------------------------------------------------*/

/* Imports                                                                    */

using Progress.Lang.*.
using adm.method.cls.*.

/*----------------------------------------------------------------------------*/
/* Class Definition                                                           */
/*----------------------------------------------------------------------------*/

class x.adm.cls.XDCUIListenerUtilSvcX
  inherits adm.base.cls.DBCproALPHA
  abstract
  :

  /*--------------------------------------------------------------------------*/
  /* Definitions                                                              */
  /*--------------------------------------------------------------------------*/

  /* Datasets ----------------------------------------------------------------*/

  /* Temp-Tables -------------------------------------------------------------*/

  /* Buffers -----------------------------------------------------------------*/

  /* Variables ---------------------------------------------------------------*/

  /*--------------------------------------------------------------------------*/
  /* Properties                                                               */
  /*--------------------------------------------------------------------------*/

  /*--------------------------------------------------------------------------*/
  /* Constructors                                                             */
  /*--------------------------------------------------------------------------*/

  /*--------------------------------------------------------------------------*/
  /* Destructors                                                              */
  /*--------------------------------------------------------------------------*/

  /*--------------------------------------------------------------------------*/
  /* Methods                                                                  */
  /*--------------------------------------------------------------------------*/

  method public void moveWidgetsInRect
    ( poUIProcedure as DMCUIProcedureSvo,
      pdRowMin        as decimal,
      pdRowMax        as decimal,
      pdColMin        as decimal,
      pdColMax        as decimal,
      pdRowDelta      as decimal, 
      pdColDelta      as decimal):
    /* Description -----------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /* Notes -----------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /* Parameters ------------------------------------------------------------*/
    /*                                                                        */
    /* poUIProcedure     UI Procedure instrance that triggered the event.     */
    /* pdRowMin          Position of start row                                */
    /* pdRowMax          Position of end row                                  */
    /* pdColMax          Position of start column                             */
    /* pdColMax          Position of end column                               */
    /* pdRowDelta        Move position in row                                 */
    /* pdColDelta        Move position in column                              */
    /*                                                                        */
    /* Examples --------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /*------------------------------------------------------------------------*/
    
    /* Variables -------------------------------------------------------------*/
    /*------------------------------------------------------------------------*/
    define variable hGroup       as widget-handle no-undo.
    define variable hWidget      as handle        no-undo.
    /* Buffers ---------------------------------------------------------------*/

    /*------------------------------------------------------------------------*/
    /* Processing                                                             */
    /*------------------------------------------------------------------------*/ 
    
    assign
      pdRowMin = 0      when pdRowMin = ?
      pdColMin = 0      when pdColMin = ?    
      pdRowMax = 999999 when pdRowMax = ?
      pdColMax = 999999 when pdColMax = ?
      .    
    
    hGroup = poUIProcedure:prphFrame:first-child.
    
    do while valid-handle(hGroup):
    
      hWidget = hGroup:first-child.
    
      /* Walk through all widgets in the group                                */
    
      do while valid-handle(hWidget):
    
        if     hWidget:column >= pdColMin
           and hWidget:column <= pdColMax
           and hWidget:row    >= pdRowMin
           and hWidget:row    <= pdRowMax then
    
          assign
            hWidget:column = decimal(hWidget:column + pdColDelta)
            hWidget:row    = decimal(hWidget:row + pdRowDelta)
            .
    
        hWidget = hWidget:next-sibling.
        
      end. /* do while valid-handle(hWidget): */
    
      hGroup = hGroup:next-sibling.
      
    end. /* do while valid-handle(hGroup): */
    
  end method. /* MoveWidgetsInRect */  
    
  method public void resizeFrame
    ( poUIProcedure as DMCUIProcedureSvo,
      pdWidth       as decimal,
      pdHeight      as decimal ):
    /* Description -----------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /* Notes -----------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /* Parameters ------------------------------------------------------------*/
    /*                                                                        */
    /* poUIProcedure     UI Procedure instrance that triggered the event.     */
    /* pdWidth           Width Resize Quantity                                */
    /* pdHeight          Height Resize Quantity                               */
    /*                                                                        */
    /* Examples --------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /*------------------------------------------------------------------------*/
    
    /* Variables -------------------------------------------------------------*/
    define variable hFrame  as handle no-undo.
    /*------------------------------------------------------------------------*/

    /* Buffers ---------------------------------------------------------------*/

    /*------------------------------------------------------------------------*/
    /* Processing                                                             */
    /*------------------------------------------------------------------------*/
     
    hFrame = poUIProcedure:prphFrame.

    poUIProcedure:setWidth(hFrame:width-chars + pdWidth).
    
    poUIProcedure:setHeight(hFrame:height-chars + pdHeight).

  end method. /* resizeFrame */  
    
  method public void resizeFrame
    ( phFrame       as handle,
      pdWidth       as decimal,
      pdHeight      as decimal ):
    /* Description -----------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /* Notes -----------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /* Parameters ------------------------------------------------------------*/
    /*                                                                        */
    /* poUIProcedure     UI Procedure instrance that triggered the event.     */
    /* pdWidth           Width Resize Quantity                                */
    /* pdHeight          Height Resize Quantity                               */
    /*                                                                        */
    /* Examples --------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /*------------------------------------------------------------------------*/
    
    /* Variables -------------------------------------------------------------*/
    /*------------------------------------------------------------------------*/

    /* Buffers ---------------------------------------------------------------*/

    /*------------------------------------------------------------------------*/
    /* Processing                                                             */
    /*------------------------------------------------------------------------*/    

    {setwidgetattr
       "phFrame"
       "width-chars"
       "decimal(phFrame:width-chars + pdWidth)"}.
       
    {setwidgetattr
       "phFrame"
       "height-chars"
       "decimal(phFrame:height-chars + pdHeight)"}.       

  end method. /* resizeFrame */
  

  method public void setWidgetPosition
    ( poWidget as DMCWidgetSvo,
      pdRow   as decimal,
      pdCol   as decimal ):
    /* Description -----------------------------------------------------------*/
    /*                                                                        */
    /* method for set widget position                                         */
    /*                                                                        */
    /* Notes -----------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /* Parameters ------------------------------------------------------------*/
    /*                                                                        */
    /* poWidget          Widget instrance                                     */
    /* pdRow             Row Position                                         */
    /* pdCol             Column Position                                      */
    /*                                                                        */
    /* Examples --------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /*------------------------------------------------------------------------*/
    
    /* Variables -------------------------------------------------------------*/
    define variable hWidget        as handle     no-undo.
    define variable hWidget-label  as handle     no-undo.
    /*------------------------------------------------------------------------*/

    /* Buffers ---------------------------------------------------------------*/

    /*------------------------------------------------------------------------*/
    /* Processing                                                             */
    /*------------------------------------------------------------------------*/    

    hWidget = poWidget:prphWidget.

    {setwidgetattr
       "hWidget"
       "row"
       "pdRow"}.
      
    {setwidgetattr
       "hWidget"
       "col"
       "pdCol"}.
       
    if can-query(hWidget, 'side-label-handle':U)
      and hWidget:side-label-handle <> ? then 
    do:
    
      hWidget-label = hWidget:side-label-handle.
      
      {setwidgetattr
         "hWidget-label"
         "row"
         "hWidget:row"}.
         
      {setwidgetattr
         "hWidget-label"
         "col"
         "hWidget:col - hWidget-label:width"}.               
      
    end. /* if can-query(hWidget, 'side-label-handle':U) */                                   

  end method. /* setWidgetPosition */  
  
    
  method public void moveWidget
    ( poWidget    as DMCWidgetSvo,
      pdRowDelta  as decimal,
      pdColDelta  as decimal ):
    /* Description -----------------------------------------------------------*/
    /*                                                                        */
    /* method for move widget                                                 */
    /*                                                                        */
    /* Notes -----------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /* Parameters ------------------------------------------------------------*/
    /*                                                                        */
    /* poWidget          Widget instrance                                     */
    /* pdRow             Row Delta Position                                   */
    /* pdCol             Column Delta Position                                */
    /*                                                                        */
    /* Examples --------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /*------------------------------------------------------------------------*/
    
    /* Variables -------------------------------------------------------------*/

    /*------------------------------------------------------------------------*/

    /* Buffers ---------------------------------------------------------------*/

    /*------------------------------------------------------------------------*/
    /* Processing                                                             */
    /*------------------------------------------------------------------------*/    

    this-object:setWidgetPosition(poWidget, 
                                  poWidget:prphWidget:row + pdRowDelta, 
                                  poWidget:prphWidget:col + pdColDelta).
    
  end method. /* moveWidget */
  

  method public void moveWidgetUsingRef
    ( poWidget    as DMCWidgetSvo,
      poRefWidget as DMCWidgetSvo,
      pdRowDelta  as decimal,
      pdColDelta  as decimal ):
    /* Description -----------------------------------------------------------*/
    /*                                                                        */
    /* method for move widget                                                 */
    /*                                                                        */
    /* Notes -----------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /* Parameters ------------------------------------------------------------*/
    /*                                                                        */
    /* poWidget          Widget instrance                                     */
    /* poRefWidget       Reference Widget instrance                           */
    /* pdRow             Row Delta Position                                   */
    /* pdCol             Column Delta Position                                */
    /*                                                                        */
    /* Examples --------------------------------------------------------------*/
    /*                                                                        */
    /*                                                                        */
    /*                                                                        */
    /*------------------------------------------------------------------------*/
    
    /* Variables -------------------------------------------------------------*/

    /*------------------------------------------------------------------------*/

    /* Buffers ---------------------------------------------------------------*/

    /*------------------------------------------------------------------------*/
    /* Processing                                                             */
    /*------------------------------------------------------------------------*/    

    this-object:setWidgetPosition(poWidget, 
                                  poRefWidget:prphWidget:row + pdRowDelta, 
                                  poRefWidget:prphWidget:col + pdColDelta).
    
  end method. /* moveWidget */  

end class. /* x.adm.cls.XDCUIListenerUtilSvcX */


/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME
