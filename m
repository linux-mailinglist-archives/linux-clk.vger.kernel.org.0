Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1935677164F
	for <lists+linux-clk@lfdr.de>; Sun,  6 Aug 2023 19:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjHFRbs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 6 Aug 2023 13:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjHFRbr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 6 Aug 2023 13:31:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BD0FA
        for <linux-clk@vger.kernel.org>; Sun,  6 Aug 2023 10:31:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E8421611C2
        for <linux-clk@vger.kernel.org>; Sun,  6 Aug 2023 17:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F63AC433C8;
        Sun,  6 Aug 2023 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691343105;
        bh=WqQcq/iEINXz8RMnCvagZGNodm+OM0Vsc80wKSLiO8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IKEg7He7kFUl20AIIDoHuxBcTaAREW7VOD8eI3toZ9y+9qGYMhnjDGnOUlDjRifcR
         UrRZbEKDp+JE/25p6YyGgYpfavyiNv3nhHSiGZnOxRDBXGi+YEhGI6reJLaWaxWvOW
         //vh2vD9+RridiJxcIej5D6SspDL1fRgo/VWAbZoIYeQkpeQNmsc4LKCAMCuxWRXJI
         0jmLfv9GnH7cNhfEXxoLFfnPesjZiXwHcukekgX7aOPPKvwgvoOU+rOdXWi8T92rWb
         s5EM9mzqxlNGSwVbelT5lfeks7vnvek8uhzcHziVotAe1d7T325DOksT/+TD9MGOW8
         Neuu6smhSFg3A==
Date:   Sun, 6 Aug 2023 19:31:40 +0200
From:   Simon Horman <horms@kernel.org>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v2 6/9] ice: add admin commands to access cgu
 configuration
Message-ID: <ZM/Y/PjPVNxbwLOL@vergenet.net>
References: <20230804190454.394062-1-vadim.fedorenko@linux.dev>
 <20230804190454.394062-7-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804190454.394062-7-vadim.fedorenko@linux.dev>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 04, 2023 at 08:04:51PM +0100, Vadim Fedorenko wrote:
> From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
> 
> Add firmware admin command to access clock generation unit
> configuration, it is required to enable Extended PTP and SyncE features
> in the driver.
> Add definitions of possible hardware variations of input and output pins
> related to clock generation unit and functions to access the data.
> 
> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

Hi Arkadiusz and Vadim,

> diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c

...

> +/**
> + * ice_aq_get_cgu_dpll_status - get dpll status
> + * @hw: pointer to the HW struct
> + * @dpll_num: DPLL index
> + * @ref_state: Reference clock state
> + * @config: current DPLL config
> + * @dpll_state: current DPLL state
> + * @phase_offset: Phase offset in ns
> + * @eec_mode: EEC_mode
> + *
> + * Get CGU DPLL status (0x0C66)
> + * Return: 0 on success or negative value on failure.
> + */
> +int
> +ice_aq_get_cgu_dpll_status(struct ice_hw *hw, u8 dpll_num, u8 *ref_state,
> +			   u8 *dpll_state, u8 *config, s64 *phase_offset,
> +			   u8 *eec_mode)
> +{
> +	struct ice_aqc_get_cgu_dpll_status *cmd;
> +	const s64 NSEC_PER_PSEC = 1000LL;

Probably this should be in lower case, or an (upper case) #define.
In the case of the latter it should probably be moved outside of the
function.

> +	struct ice_aq_desc desc;
> +	int status;
> +
> +	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_get_cgu_dpll_status);
> +	cmd = &desc.params.get_cgu_dpll_status;
> +	cmd->dpll_num = dpll_num;
> +
> +	status = ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
> +	if (!status) {
> +		*ref_state = cmd->ref_state;
> +		*dpll_state = cmd->dpll_state;
> +		*config = cmd->config;
> +		*phase_offset = le32_to_cpu(cmd->phase_offset_h);
> +		*phase_offset <<= 32;
> +		*phase_offset += le32_to_cpu(cmd->phase_offset_l);
> +		*phase_offset = sign_extend64(*phase_offset, 47) /
> +			NSEC_PER_PSEC;

This causes a build failure on x86_32.

  ERROR: modpost: "__divdi3" [drivers/net/ethernet/intel/ice/ice.ko] undefined!

Possibly you want (please do check for yourself):

		*phase_offset = div64_s64(sign_extend64(*phase_offset, 47),
					  NSEC_PER_PSEC);

> +		*eec_mode = cmd->eec_mode;
> +	}
> +
> +	return status;
> +}
> +
> +/**
> + * ice_aq_set_cgu_dpll_config - set dpll config
> + * @hw: pointer to the HW struct
> + * @dpll_num: DPLL index
> + * @ref_state: Reference clock state
> + * @config: DPLL config
> + * @eec_mode: EEC mode
> + *
> + * Set CGU DPLL config (0x0C67)
> + * Return: 0 on success or negative value on failure.
> + */
> +int
> +ice_aq_set_cgu_dpll_config(struct ice_hw *hw, u8 dpll_num, u8 ref_state,
> +			   u8 config, u8 eec_mode)
> +{
> +	struct ice_aqc_set_cgu_dpll_config *cmd;
> +	struct ice_aq_desc desc;
> +
> +	ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_set_cgu_dpll_config);
> +	cmd = &desc.params.set_cgu_dpll_config;
> +	cmd->dpll_num = dpll_num;
> +	cmd->ref_state = ref_state;
> +	cmd->config = config;
> +	cmd->eec_mode = eec_mode;
> +
> +	return ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
> +}
> +
> +/**
> + * ice_aq_set_cgu_ref_prio - set input refernce priority

nit: refernce -> reference

> + * @hw: pointer to the HW struct
> + * @dpll_num: DPLL index
> + * @ref_idx: Reference pin index
> + * @ref_priority: Reference input priority
> + *
> + * Set CGU reference priority (0x0C68)
> + * Return: 0 on success or negative value on failure.
> + */

...

-- 
pw-bot: changes-requested

