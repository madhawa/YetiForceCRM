{*<!-- {[The file is published on the basis of YetiForce Public License that can be found in the following directory: licenses/License.html]} --!>*}
{strip}
	{assign var="REFERENCE_MODULE" value=$FIELD->get('params')}
	{assign var="FIELD_NAME" value={$FIELD->getColumnName()}|cat:$ROW_NO}
	{assign var="FIELD_INFO" value=Vtiger_Util_Helper::toSafeHTML(Zend_Json::encode(['mandatory'=>true]))}

	<div class="input-group" style="max-width: 250px;">
		<input name="popupReferenceModule" type="hidden" data-multi-reference="1" value="{$REFERENCE_MODULE}" />
		<input name="{$FIELD_NAME}" type="hidden" value="{$ITEM_VALUE}" title="{$ITEM_VALUE}" class="sourceField" data-displayvalue='{$FIELD->getEditValue($ITEM_VALUE)}' data-fieldinfo='{$FIELD_INFO}' {if $FIELD->get('displaytype') == 10}readonly="readonly"{/if} />
		{assign var="displayId" value=$ITEM_VALUE}
		{if $FIELD->get('displaytype') != 10}
			<span class="input-group-addon clearReferenceSelection cursorPointer">
				<span id="{$MODULE}_editView_fieldName_{$FIELD_NAME}_clear" class="glyphicon glyphicon-remove-sign" title="{vtranslate('LBL_CLEAR', $MODULE)}"></span>
			</span>
		{/if}
		<input id="{$FIELD_NAME}_display" name="{$FIELD_NAME}_display" type="text" title="{$FIELD->getEditValue($ITEM_VALUE)}" class="marginLeftZero form-control autoComplete" {if !empty($ITEM_VALUE)}readonly="true"{/if}
			   value="{Vtiger_Util_Helper::toSafeHTML($FIELD->getEditValue($ITEM_VALUE))}" data-validation-engine="validate[{if $FIELD->isMandatory() eq true} required,{/if}funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
			   data-fieldinfo="{$FIELD_INFO}" {if $FIELD->get('displaytype') != 10}placeholder="{vtranslate('LBL_TYPE_SEARCH',$MODULE)}"{/if}
			   {if $FIELD->get('displaytype') == 10}readonly="readonly"{/if}/>
		{if $FIELD->get('displaytype') != 10}
			<span class="input-group-addon relatedPopup cursorPointer">
				<span id="{$MODULE}_editView_fieldName_{$FIELD_NAME}_select" class="glyphicon glyphicon-search relatedPopup" title="{vtranslate('LBL_SELECT', $MODULE)}" ></span>
			</span>
		{/if}
		{assign var=REFERENCE_MODULE_MODEL value=Vtiger_Module_Model::getInstance($REFERENCE_MODULE)}
		<!-- Show the add button only if it is edit view  -->
		{if $smarty.request.view eq 'Edit' && $REFERENCE_MODULE_MODEL->isQuickCreateSupported() && $FIELD->get('displaytype') != 10}
			<span class="input-group-addon cursorPointer createReferenceRecord">
				<span id="{$MODULE}_editView_fieldName_{$FIELD_NAME}_create" class="glyphicon glyphicon-plus" title="{vtranslate('LBL_CREATE', $MODULE)}"></span>
			</span>
		{/if}
	</div>
{/strip}