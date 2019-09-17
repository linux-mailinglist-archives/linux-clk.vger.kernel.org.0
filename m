Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFF9B46EC
	for <lists+linux-clk@lfdr.de>; Tue, 17 Sep 2019 07:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391109AbfIQFof (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Sep 2019 01:44:35 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46943 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbfIQFof (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Sep 2019 01:44:35 -0400
Received: by mail-ua1-f65.google.com with SMTP id k12so681982uan.13
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2019 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aWLbKiwRlS208Z3+3AMSNgvhyJJKUZ0x7Hzk0zm86yg=;
        b=mHgLFOns1Q8pXhphDAfob5kfnh4UcmO03EkmEF12HNV6uR4Qno8zQEPxHXzhgHUrcr
         kewUlr7NxVnQ4PnWNzV8t88xJLA3EKmTZUxISQDqOotlVDFgEd7zAQ/uPjFpd7Hldor3
         d9oBHQku82cjL3DWPdKTo2lBdvoYiUd6yB1XHD8EXnHAbSwbugEAF7vPCB7W+hcHHICC
         4XMgP+jZQENSLrAeTm/uNbxHaA0YjpvBJTs2fxmDN51BvYHMmzyk/2QYv9K2Vii18Xk+
         MsJRPeayYD3HVFu2SvFWk6qswSvGngTNlz2DrWjU6LOkjOQy1g2Osvw1nC+/G7RsHuC8
         Terw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aWLbKiwRlS208Z3+3AMSNgvhyJJKUZ0x7Hzk0zm86yg=;
        b=Ey+719ySjj6iwKDFyPVE1vYZ1jwg8yV0QQyLwVSXutdQu3gf1dB1ksPY7aivmTdpbs
         LkDZzDye/T4bxqwgbEL/dpF7K6LY1km/EaYs1u7ukr54D24fH1Mzb7YeKvz3wicCn+Aj
         9ufjpw/0L3uVEkhuAsMZ9DgviSpyOAIJt8cAMJ2YezDnXt3fGaMz0hPL3Mnnsr/ybgkW
         PtUhFtq/c8fhzGEbO7vcZYbi+5SlJF+tafwLEx+zyCZkqOp2gxUI96i7hzLmS+sixTgh
         dmWDX5g6+HM2jEdX/qi0woC65AeEBFlbUI++l49JL/CoYB6cpxMpzjZ2dNA6Jw9ktYQy
         w/6Q==
X-Gm-Message-State: APjAAAUy8/kqcIf9EgsYTBYasOI9SpeltYWPQnXEnt6EnLpblvszHq9T
        qA7EtWSsaTCLGD9IqzTXE+oDYG87fQnUJBhDDqsQnQ==
X-Google-Smtp-Source: APXvYqykoJrSGi+xeUz/j8IFT5604ond2RCO1ES3sXqJPjir0wt/iu+bHY6zaeJiBuBtp/FFUSbJNrd1ImAhCmm6N9E=
X-Received: by 2002:ab0:539d:: with SMTP id k29mr612429uaa.67.1568699073725;
 Mon, 16 Sep 2019 22:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568240476.git.amit.kucheria@linaro.org>
 <c88947d18c65a692a8f314e4ad996d9d2a997997.1568240476.git.amit.kucheria@linaro.org>
 <5d7fe862.1c69fb81.8e5e3.2325@mx.google.com>
In-Reply-To: <5d7fe862.1c69fb81.8e5e3.2325@mx.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 17 Sep 2019 11:14:22 +0530
Message-ID: <CAHLCerMnFvMvAYOnJHoHwkMNhn1n=vpT1TL9nuGM8tBc0sDDRg@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: qcom: Initialise clock drivers earlier
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>, ilina@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 17, 2019 at 1:24 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-09-11 15:32:33)
> > Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
> > can have earlier access to cpufreq during booting.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
>
> Did you want this patch to go through clk tree?

Yes, This patch can go in via the clk tree regardless of the rest of the series.

Regards,
Amit
