Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294DE516DFC
	for <lists+linux-clk@lfdr.de>; Mon,  2 May 2022 12:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384419AbiEBKR1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 2 May 2022 06:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384417AbiEBKR1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 May 2022 06:17:27 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900E9103
        for <linux-clk@vger.kernel.org>; Mon,  2 May 2022 03:13:58 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id p6so12305856pjm.1
        for <linux-clk@vger.kernel.org>; Mon, 02 May 2022 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=shQaSnVKrqLWN+k12ZUY2V1AzAclSYo5tWPsZzLNBLA=;
        b=pS3BqZc8mAM7Phnolkqy2kMdrOUg+Gtz6Qfk9PjaDjnjYphg5T+RoV3b1QbSQVw0Mr
         JKRGSpVps1LJOxQpSIE2VCruMP5ZhF9lTkk5y24jk53TbenBp2Anm4F8cj8WVVLnCWGU
         Xy/zpc1RmgpEsei+UiiA9pK5EeCwbrp3g4tDQ5XDDh3L8Pewn+X7nUZwtp6Io+5+HOyg
         G2Vztq9b4oVnfJ6fhT0iYPuSKhlripCHsQB0T0zigFMm9vw8/V33pAn9vbBfWJQVV8RT
         bdE4UfTzSMw/nEfq3DZlxPvj/9EmN88JKqyq/vZtA1xZnknByZP5D/rBMyBtvMB/K9P5
         NucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=shQaSnVKrqLWN+k12ZUY2V1AzAclSYo5tWPsZzLNBLA=;
        b=GURrFbnVMOv4mL2LdMRRD1SsM0qbzJ51PSDfGCV2D48GHDQzfc1rvsHlKB0A5kjGM2
         BTTPoWjOQ/vudSOdJVEgM7Q9vawgCaxQZtQEQ77tW3Obbp2TJuFqSQA47buMvoIbY5g5
         XYYoJUUSDoopIAIg0ck0rtxePgE95Y+RSfyvIhyF8yIBu50BWLozFvDRtO0zUG7IRzJa
         s/eKBengw+sZm//X44nl+pM2aEEDrZGWv2pefpRdu73Bn/8kKtnZ7IFg1KXncQbjLowN
         NbOvEom3OJR/sgyviMDGCX8J8JSNUpI/Vux/hJ8SpPsyuSFxD1Ct7MeDJKrU2NB6Rqha
         e4+w==
X-Gm-Message-State: AOAM532oUe7bz8DeubQ2so+e7hIcPjCJ/Ikt8lrOJ2C85h7wqF5qoteX
        88LBAxCd+U2Mvv4GcGiiF94/
X-Google-Smtp-Source: ABdhPJypXvSZ+mgeJ4qYVZ6Fb2Ofaqaydtbaex/sRoKKzbN9j2KnL+nAlW+5+cpikuAeSsmh2bs8kQ==
X-Received: by 2002:a17:903:283:b0:152:157:eb7 with SMTP id j3-20020a170903028300b0015201570eb7mr517950plr.109.1651486438040;
        Mon, 02 May 2022 03:13:58 -0700 (PDT)
Received: from thinkpad ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id j16-20020aa783d0000000b0050dc76281b8sm4495916pfn.146.2022.05.02.03.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:13:57 -0700 (PDT)
Date:   Mon, 2 May 2022 15:43:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <quic_pmaliset@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 1/5] PCI: qcom: Remove unnecessary pipe_clk handling
Message-ID: <20220502101351.GG5053@thinkpad>
References: <20220501192149.4128158-1-dmitry.baryshkov@linaro.org>
 <20220501192149.4128158-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501192149.4128158-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, May 01, 2022 at 10:21:45PM +0300, Dmitry Baryshkov wrote:
> QMP PHY driver already does clk_prepare_enable()/_disable() pipe_clk.
> Remove extra calls to enable/disable this clock from the PCIe driver, so
> that the PHY driver can manage the clock on its own.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 44 ++------------------------
>  1 file changed, 3 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 57636246cecc..a6becafb6a77 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -128,7 +128,6 @@ struct qcom_pcie_resources_2_3_2 {
>  	struct clk *master_clk;
>  	struct clk *slave_clk;
>  	struct clk *cfg_clk;
> -	struct clk *pipe_clk;
>  	struct regulator_bulk_data supplies[QCOM_PCIE_2_3_2_MAX_SUPPLY];
>  };
>  
> @@ -165,7 +164,6 @@ struct qcom_pcie_resources_2_7_0 {
>  	int num_clks;
>  	struct regulator_bulk_data supplies[2];
>  	struct reset_control *pci_reset;
> -	struct clk *pipe_clk;
>  	struct clk *pipe_clk_src;
>  	struct clk *phy_pipe_clk;
>  	struct clk *ref_clk_src;
> @@ -597,8 +595,7 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
>  	if (IS_ERR(res->slave_clk))
>  		return PTR_ERR(res->slave_clk);
>  
> -	res->pipe_clk = devm_clk_get(dev, "pipe");
> -	return PTR_ERR_OR_ZERO(res->pipe_clk);
> +	return 0;
>  }
>  
>  static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
> @@ -613,13 +610,6 @@ static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
>  	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
>  }
>  
> -static void qcom_pcie_post_deinit_2_3_2(struct qcom_pcie *pcie)
> -{
> -	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
> -
> -	clk_disable_unprepare(res->pipe_clk);
> -}
> -
>  static int qcom_pcie_init_2_3_2(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
> @@ -694,22 +684,6 @@ static int qcom_pcie_init_2_3_2(struct qcom_pcie *pcie)
>  	return ret;
>  }
>  
> -static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
> -{
> -	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
> -	struct dw_pcie *pci = pcie->pci;
> -	struct device *dev = pci->dev;
> -	int ret;
> -
> -	ret = clk_prepare_enable(res->pipe_clk);
> -	if (ret) {
> -		dev_err(dev, "cannot prepare/enable pipe clock\n");
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int qcom_pcie_get_resources_2_4_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_4_0 *res = &pcie->res.v2_4_0;
> @@ -1198,8 +1172,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  			return PTR_ERR(res->ref_clk_src);
>  	}
>  
> -	res->pipe_clk = devm_clk_get(dev, "pipe");
> -	return PTR_ERR_OR_ZERO(res->pipe_clk);
> +	return 0;
>  }
>  
>  static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
> @@ -1292,14 +1265,7 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  	if (pcie->cfg->pipe_clk_need_muxing)
>  		clk_set_parent(res->pipe_clk_src, res->phy_pipe_clk);
>  
> -	return clk_prepare_enable(res->pipe_clk);
> -}
> -
> -static void qcom_pcie_post_deinit_2_7_0(struct qcom_pcie *pcie)
> -{
> -	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> -
> -	clk_disable_unprepare(res->pipe_clk);
> +	return 0;
>  }
>  
>  static int qcom_pcie_link_up(struct dw_pcie *pci)
> @@ -1449,9 +1415,7 @@ static const struct qcom_pcie_ops ops_1_0_0 = {
>  static const struct qcom_pcie_ops ops_2_3_2 = {
>  	.get_resources = qcom_pcie_get_resources_2_3_2,
>  	.init = qcom_pcie_init_2_3_2,
> -	.post_init = qcom_pcie_post_init_2_3_2,
>  	.deinit = qcom_pcie_deinit_2_3_2,
> -	.post_deinit = qcom_pcie_post_deinit_2_3_2,
>  	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
>  };
>  
> @@ -1478,7 +1442,6 @@ static const struct qcom_pcie_ops ops_2_7_0 = {
>  	.deinit = qcom_pcie_deinit_2_7_0,
>  	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
>  	.post_init = qcom_pcie_post_init_2_7_0,
> -	.post_deinit = qcom_pcie_post_deinit_2_7_0,
>  };
>  
>  /* Qcom IP rev.: 1.9.0 */
> @@ -1488,7 +1451,6 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
>  	.deinit = qcom_pcie_deinit_2_7_0,
>  	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
>  	.post_init = qcom_pcie_post_init_2_7_0,
> -	.post_deinit = qcom_pcie_post_deinit_2_7_0,
>  	.config_sid = qcom_pcie_config_sid_sm8250,
>  };
>  
> -- 
> 2.35.1
> 
