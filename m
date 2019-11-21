Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 674091052E2
	for <lists+linux-clk@lfdr.de>; Thu, 21 Nov 2019 14:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfKUN0T (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Nov 2019 08:26:19 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40486 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfKUN0T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Nov 2019 08:26:19 -0500
Received: by mail-lj1-f196.google.com with SMTP id q2so3212179ljg.7
        for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2019 05:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xJRNK0Qg4edNo891F12WcaxFjq+8J+URcTnOpfArGZA=;
        b=mI1d4Uv5D/Bus8GV84GRYJ2Ncp3cqsWvdXlM91npLZDdJiOCOfyq9LDHai55KaNeVu
         gYEEej9KWdg8xr6DeyhLdh1n6CHugCzkWjzX2NNNKF7VFunY9zf+LRzqaYQLRcG/FI4k
         A21SMEQJLpyfTw0biysL+Wvvi0ffrMXablxTW/Po8OeSAsMrADDNfHtq24xwxr5UPiT6
         UWYgO9L/ji4dNp+OQBpraE62/xsw/ym86DzCGRIvinmM1AVOnOTd50zlNQhsB9UBvHML
         aRf4/MdbkkvuX2VHuy7gcHRUtWsIRBV8NKyb4DP4WmKmKNEFLjIk9yZeZvHhoOn9d6Cn
         ADDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJRNK0Qg4edNo891F12WcaxFjq+8J+URcTnOpfArGZA=;
        b=hqDdbS6uI+66CSzVCAMEay7U9D4olmwUoDL8qhKmNyxRnQ9TcBROEkse+m90WWPc7x
         9QPuhcXjAxXWtqgvu2tI9HElNCbCAMMXv2cuMoKWsE1paqmwkzWPfbfUOcBJjSLVaz99
         JtVHPbwJeKYPwNs6JkFDW7/Kz1ntYnXToK628Vz1Qq1ZuearHw3cUa22vnEFZeyTmJIS
         Zt80HdHbOlJvwN1tm4YhOKaHr/UanSrvYLvsOxZjfyab3/qmN0CnDMLVJMev8Edj675Q
         3BUGQhpfB2O6qfnHtM3YlxWvO04NraXkgiWyMphKnLCJ2Aa1/IXhwOl+q1LFi4Is3DZ/
         YV2Q==
X-Gm-Message-State: APjAAAXHvsspqg66wB5b56emXidsObTOxAeBIkxvHj+pVV/xFzFg15bL
        iPRnSdDn6sVh6MoIEz2aJSAyY73hLRAxjn8EdYImyQ==
X-Google-Smtp-Source: APXvYqyGELuxKmjPuMZto5yMs7olv3FH+bNGkzNsg2SSLxSSkTaD5XBMqmcP5UzRxEveFBkgx0i7iCQUEJV15L3MB30=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr7487009lji.218.1574342777013;
 Thu, 21 Nov 2019 05:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20191121100726.17725-1-ulf.hansson@linaro.org>
In-Reply-To: <20191121100726.17725-1-ulf.hansson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:26:04 +0100
Message-ID: <CACRpkdZyP+DdZri1D7WADK=f5Lt6i-xH5FLPuuH8=6hhj2tV8A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update section for Ux500 clock drivers
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 21, 2019 at 11:07 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:

> There's no longer any need host a tree solely to serve changes for the
> Ux500 clock driver, thus drop this from the corresponding section and use
> the common clk tree instead.
>
> Moreover, let's also add the generic linux-clk mailing list and rename the
> section header.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
