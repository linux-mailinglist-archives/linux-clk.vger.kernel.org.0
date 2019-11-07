Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC990F2689
	for <lists+linux-clk@lfdr.de>; Thu,  7 Nov 2019 05:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733118AbfKGEY4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Nov 2019 23:24:56 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:41823 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733076AbfKGEYz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Nov 2019 23:24:55 -0500
Received: by mail-il1-f195.google.com with SMTP id z10so556163ilo.8
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2019 20:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NkSeoMnuWg5T7g24I3SC9PrtQXIiA61Z2VNxVdt/qfE=;
        b=KeT43MVjU2B4DpAy2SYkA6NIhlp0NXSIvrPo/xsJrBm01MgR7r5J7gwjL6ER2SKvvu
         6zZI/iChBctFpUxgVnyp2K9HXsspnceqjcg0uSaOkMkVpQYDzb35q4B4mpiwWuV4v6yj
         34iZRafJSCVKeLd8feC04XhdnMKrH3chAmGDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NkSeoMnuWg5T7g24I3SC9PrtQXIiA61Z2VNxVdt/qfE=;
        b=WnJO9FSF83kfB1nkHNL50kYS0eGsdrXnz1Boico3oWyEWu6QCXOCPsdJvpw2T4M9wU
         3PjObptHeTi6Q9QN3uvVaapG3k3J3fepoEbCDf6Db4f5EG/eks/DBao4nxEgapmcRm91
         KpA1SkbTnWxNbHK6CaPQjcfmNtZYnImVaXVBoNhwEknnk2WPEGWaO8h28EEUTjxKLG0j
         PtFbLLJWqUkSwREL7H+zZvtW7CjyV3LaVDuYw/NdKQmzgllVyrr1PlJEmKEf47KWVpgM
         8WKGzAZBlcwgqip+dwmkguJh3T0ttwwybfbeTdYQtiFQJ2/benx5ljHsD5saUGT6hHpo
         3rPQ==
X-Gm-Message-State: APjAAAUT3bGgo+MynJhY1mPBymcfWNCnF3aMLFEwwMwvzQMlkFY1Agi2
        FWy45JBU4N4mNNFByopWumeb/AcwGYg=
X-Google-Smtp-Source: APXvYqwS+9btDCXG+2/dCZPk0RdMkl/+KpgG1snpyef7cWoZ48nScd8F0hJC7+d4yAHYIFoxOHV1ag==
X-Received: by 2002:a92:5c5d:: with SMTP id q90mr1874147ilb.22.1573100694605;
        Wed, 06 Nov 2019 20:24:54 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id c14sm144499iln.52.2019.11.06.20.24.53
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 20:24:53 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id s75so575246ilc.3
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2019 20:24:53 -0800 (PST)
X-Received: by 2002:a92:109c:: with SMTP id 28mr1827293ilq.142.1573100692855;
 Wed, 06 Nov 2019 20:24:52 -0800 (PST)
MIME-Version: 1.0
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org> <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 Nov 2019 20:24:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UjwO25HeVtYvzqEdUxyA4ED18ZxcwEaYVzBGRFTa2FTw@mail.gmail.com>
Message-ID: <CAD=FV=UjwO25HeVtYvzqEdUxyA4ED18ZxcwEaYVzBGRFTa2FTw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] clk: qcom: clk-alpha-pll: Add support for Fabia
 PLL calibration
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, Oct 31, 2019 at 5:21 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> @@ -1141,15 +1160,11 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
>                                                 unsigned long prate)
>  {
>         struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> -       u32 val, l, alpha_width = pll_alpha_width(pll);
> +       u32 l, alpha_width = pll_alpha_width(pll);
>         u64 a;
>         unsigned long rrate;
>         int ret = 0;
>
> -       ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> -       if (ret)
> -               return ret;

My compiler happened to notice that with the change to this function:

drivers/clk/qcom/clk-alpha-pll.c:1166:6: error: unused variable 'ret'
[-Werror,-Wunused-variable]
        int ret = 0;

-Doug
