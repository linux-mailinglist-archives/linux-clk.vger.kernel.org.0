Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB7D45929D
	for <lists+linux-clk@lfdr.de>; Mon, 22 Nov 2021 17:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbhKVQHE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Nov 2021 11:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbhKVQHE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Nov 2021 11:07:04 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833CDC061714
        for <linux-clk@vger.kernel.org>; Mon, 22 Nov 2021 08:03:57 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id l24so37662791uak.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Nov 2021 08:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k01X7HLQW+k2kjIuefa6cfmdvw6hKa9dfM63nn0fC24=;
        b=tEFZfAxLA9Ph2Oo2CFd7i4n+xuUSG1w6qoBmYut6gEDnchWzNHOC/zt4nkaL+YyG4t
         WKMyqObdem1DJw4YBT+Th0UJT7tPmXjOLdJ3nBx5TyGL3F4AQY7aRPrJRFuiWqtuHOIw
         x3pUPG2Bk0KhfSCaBJVN7IMcgNJuZQlqajueKiOVU6EffMA3ItMwheOtLWCzXL4ROa7o
         Ku00+QsKYjHgTFPLN3LvV0uECgKcBY4/Q2xgldOIAEsAs5WvmcCY20sj98ysDMYn1ESW
         nABieCPiHTQoyt01ynvy9acBERyMQDF7K9VuR5MXTIJNZdDO27Kp5+OsuZMpQc2UBNu1
         i7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k01X7HLQW+k2kjIuefa6cfmdvw6hKa9dfM63nn0fC24=;
        b=XTa6lnr6BVJoqwJxMJQcjPRm5kJu4UNw2xhgGHFMAA/+zij51oPL6Wm+DYBAu0DO/q
         B3alE6ER+w2snD1ESBtdD8chZDfNnESranqKlQR51MJcIalqc/spovNE/7W4lhwdO+z7
         Tr2WK8P0JhmbVMOGbINmTyphOWhW6TS3IOwnL5H8pn1sSqjiERlpjKk26mDy7AOe2ESH
         Ys1gs7jhdBVNKGXpQxMO7Kc5NXAt7DkpC868T7KuWZ3g1HfxgWb3CTDR1Kq+teU5GUzh
         y9NtVjSUWkbVUdKxR3ehfzxPQGvZ+eVvDeYyRE0zIjX1A4Jj+Tdk88NokLeN8ah2YRQf
         E0Aw==
X-Gm-Message-State: AOAM5331YAGSzJDfAZiGRKPlopbfuexkfVXlvG3OKKSSJ0sj7Urd0MU5
        5ZHGyrAcuxXWw3VKavYgcCjTs+uNbVV2bRibMQaHpw==
X-Google-Smtp-Source: ABdhPJz4CLAMIeE69lGuhlgRG87VJp7SsFQbPEx7lhqds0H3jnLEbxgyl225ynuwfmyWEDQqrCSd4hjXxwXXvCICwJE=
X-Received: by 2002:a05:6102:ac3:: with SMTP id m3mr117236680vsh.1.1637597036721;
 Mon, 22 Nov 2021 08:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20211013172042.10884-1-semen.protsenko@linaro.org>
 <CAOMZO5CT+5=py=TBUMOZKRDsacNnGWV2TPBE7RtnZ3ocBBVReA@mail.gmail.com> <CAPLW+4ne9xDxDW=RCzjXURujGCwbCU5mOrfPJ6bn2wY41jstiw@mail.gmail.com>
In-Reply-To: <CAPLW+4ne9xDxDW=RCzjXURujGCwbCU5mOrfPJ6bn2wY41jstiw@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 22 Nov 2021 18:03:44 +0200
Message-ID: <CAPLW+4kp6G8QeMUggEhMLyB6gfbNpiyp1hn_+O76C_iVoAj53g@mail.gmail.com>
Subject: Re: [PATCH v6] clk: Add write operation for clk_parent debugfs node
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 19 Oct 2021 at 16:32, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> On Wed, 13 Oct 2021 at 21:04, Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Sam,
> >
> > On Wed, Oct 13, 2021 at 2:20 PM Sam Protsenko
> > <semen.protsenko@linaro.org> wrote:
> > >
> > > Useful for testing mux clocks. One can write the index of the parent to
> > > be set into clk_parent node, starting from 0. Example
> > >
> > >     # cd /sys/kernel/debug/clk/mout_peri_bus
> > >     # cat clk_possible_parents
> > >       dout_shared0_div4 dout_shared1_div4
> > >     # cat clk_parent
> > >       dout_shared0_div4
> > >     # echo 1 > clk_parent
> > >     # cat clk_parent
> > >       dout_shared1_div4
> > >
> > > CLOCK_ALLOW_WRITE_DEBUGFS has to be defined in drivers/clk/clk.c in
> > > order to use this feature.
> > >
> > > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > This is useful, thanks:
> >
> > Reviewed-by: Fabio Estevam <festevam@gmail.com>
>
> Hi Michael, Stephen,
>
> If there are no outstanding comments, can you please take this one?
>

Bump.

> Thanks!
