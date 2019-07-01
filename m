Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5528047951
	for <lists+linux-clk@lfdr.de>; Mon, 17 Jun 2019 06:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfFQE0B (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 17 Jun 2019 00:26:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38519 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfFQE0B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jun 2019 00:26:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id v11so5028247pgl.5
        for <linux-clk@vger.kernel.org>; Sun, 16 Jun 2019 21:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qysG3nPvhaAKSI9smIDIahzbODrHWbyjnj/GEJuZrXc=;
        b=u3kYQd8fFjb8wpRDhwAa5rO79xLm9+fj8aqWcR2QSKCMXe2jRFJkOBK2DwnPsnNUrZ
         Yb8M9Tbrlj9cEnJJtGXUmhl64KEdwxX/bCgynnsWorkVUsQUw9zjJc1Vo5xkQE/Muadi
         FzcfohxA99T67AJNG4hw0HWjdMYJrUtCg7QM/kxIgjz0Gm4oyEmGDjPcHcnsayJrYhVu
         dMEv3DIceOVTok1s1OgSH1aMjgEvOQtJoHd7Sjb7/fKi7K8CvKcHclOauZXnHEHm9LIN
         lJBGRAnFuf+vVDw5VmpBc1e3sDTSoWLjGDlq5HVnKTM1ab7HlG68Ys0yiJ8SUcWv+ezD
         D3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qysG3nPvhaAKSI9smIDIahzbODrHWbyjnj/GEJuZrXc=;
        b=fOU2oS01GgL6cCdpiTROqZpY52OQyGfC1R/zLtUvb6+/2dC8Cuv8zaJ9mnn76QM56C
         gmyougOuXE+7UC6+GLkfaIP0nuirwV5oVEAC6513BqsoI3S0rcfL1pIRoGnV+ubaZoM8
         7+zCombEhSR2vIYx6Z+pu+kBHxRe9vFAAOb9MrXCuOkC4h4kk6jXRe2mEXY1kHx2gAlH
         ioCN/1q71jpoCcFw4+aCn/lSblJhH36MR+dcgK/3Q6kYd2pfJDkLINiKEprvgnExHaem
         gbXPGwKJr0bd1rdZ7OL+O4U5Zwg87IpyhTzyu4VH/ZldjN+SL2ozeSHs7JLx0rTmcrba
         lhFA==
X-Gm-Message-State: APjAAAXWgeffWT08A+6MDDMiDtPdedZDOfkyT6TevzGLNPWVrKF/ZFaE
        TIMh8xHcswuzNKvTb3w9IijH0A==
X-Google-Smtp-Source: APXvYqyJeQVOiKNn2uH00eViwNZ2A0p4ruEvZhX33ERCjJ1TqcY9/NohX8ZMrMRGnZinEjIAN8823w==
X-Received: by 2002:a17:90a:9bc5:: with SMTP id b5mr24261795pjw.109.1560745560700;
        Sun, 16 Jun 2019 21:26:00 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p9sm9513938pjo.26.2019.06.16.21.25.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 21:26:00 -0700 (PDT)
Date:   Sun, 16 Jun 2019 21:26:49 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/5] clk: qcom: gcc-qcs404: Add MODULE_ALIAS
Message-ID: <20190617042649.GF750@tuxbook-pro>
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612091722.9377-4-vkoul@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 12 Jun 02:17 PDT 2019, Vinod Koul wrote:

> MODULE_ALIAS was missing for this driver which can be built as a
> module, so add the MODULE_ALIAS.
> 

MODULE_ALIAS() serves the purpose of providing an module alias for the
driver, which allows the automatic kernel module loader to insmod the
driver as a device needing it is being registered.

When the device is instantiated through the OF code path the compatible
will be matched against the MODULE_DEVICE_TABLE(of, ) and if the device
is programmatically registered (through platform_device_register_*())
then the alias "platform:XYZ" will be used.


So, unless we're going to support module autoloading of this driver from
a board file no alias should be needed.

Regards,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/gcc-qcs404.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index a54807eb3b28..eb3ac7a26fb8 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -2828,3 +2828,4 @@ module_exit(gcc_qcs404_exit);
>  
>  MODULE_DESCRIPTION("Qualcomm GCC QCS404 Driver");
>  MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:gcc-qcs404");
> -- 
> 2.20.1
> 
