Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A85BC9D9
	for <lists+linux-clk@lfdr.de>; Tue, 24 Sep 2019 16:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409713AbfIXOK3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Sep 2019 10:10:29 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:38718 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406459AbfIXOK3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Sep 2019 10:10:29 -0400
Received: by mail-wr1-f41.google.com with SMTP id l11so2133632wrx.5
        for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2019 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=CD8NXjWHXI1PHdT+Yt5q2iCIoHrQv0Ncx4K7iwz1VKY=;
        b=zBxpjFaP7l2EinUCWp0CpW2Sg1KTXXAkWldWE1wejALSHl3jp0sFDuHfH9Gi2HC2Au
         kzQ8eNjBepwuBE+WbnhNaJeaA2YgNuzXB5kwhQzzLXinKPvQCT716XwpcJ0OQwEW4Q1k
         mYBZVNfAVOI9FS3MUBcZFqmEz8BMf5scqsMrQSYS7a0Jda+62JkKZCi45L2ODbr/7ITr
         EoZCg4hKA2dNdppOt/WLSZcVso9BHBuKo+dAoQSrK79NYYuSijPjb9/ZAnfpmak9bhlW
         Khimacswau6lOgHXL5Nurct25X6UOV0+d8wHpX6mo9I/A7DTGUsuFceEWn1DJa/iOWon
         b9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=CD8NXjWHXI1PHdT+Yt5q2iCIoHrQv0Ncx4K7iwz1VKY=;
        b=haDAhdv98UeMMCWNH3X0U6b5ghLlAyBCHrR5tS1gDKKDK8Cc01E3Zv3DgsVwqsYL2a
         sXMIZSHwgbc2NAPWJZqeuK8lqY4N8U23htwtlZfQf6gQjsurXMnww+wEGXM08aNZKPMq
         5TMnPZKxxVHSUCKmYlzL2qQgE4O2Ebo95WXlGA8H4+mm6ipUX/EZdhbPHgNCT/m0t/Ai
         2/onBcijQ45XxAunjlYhEuoeVTwplUsTY35/rZ6b6aSgwRT7jqtazARXZoALQjQlNjAf
         /FiXcEzBm8LRX9OchH9GUoTnL04uhA6sjZzh7bJ4NeNmrpdcNS9Q4ppEixybrZ9PHYGC
         0kXw==
X-Gm-Message-State: APjAAAWLAN5ZAeKdypD/CY9DNDQ1QCPa77AuTb2+IbQ0IHWfrQp6rqL8
        gR/Uua43m5dR5W5HtZbUwvVfmg==
X-Google-Smtp-Source: APXvYqyxcFFWxlfEByHp+UI2Ozbsm+7ZlCpzeuoY03TS06zxKMIrzCq38xzQB0qK8eF54jJ/spcLAg==
X-Received: by 2002:adf:e7ca:: with SMTP id e10mr2442564wrn.234.1569334227683;
        Tue, 24 Sep 2019 07:10:27 -0700 (PDT)
Received: from localhost (uluru.liltaz.com. [163.172.81.188])
        by smtp.gmail.com with ESMTPSA id f83sm61195wmf.43.2019.09.24.07.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 07:10:26 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Ankur Tyagi <Ankur.Tyagi@gallagher.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     "linux-clk\@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Tero Kristo <t-kristo@ti.com>, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        "netdev\@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-amlogic\@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux-arm-msm\@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-rockchip\@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-omap\@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: RE: [PATCH 2/3] clk: let init callback return an error code
In-Reply-To: <ME2PR01MB4738B127557AE20F6315AA7FE5840@ME2PR01MB4738.ausprd01.prod.outlook.com>
References: <20190924123954.31561-1-jbrunet@baylibre.com> <20190924123954.31561-3-jbrunet@baylibre.com> <ME2PR01MB4738B127557AE20F6315AA7FE5840@ME2PR01MB4738.ausprd01.prod.outlook.com>
Date:   Tue, 24 Sep 2019 16:10:25 +0200
Message-ID: <1jv9thlr8u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 24 Sep 2019 at 13:38, Ankur Tyagi <Ankur.Tyagi@gallagher.com> wrote:

> Hi,
>
> I am no expert here but just looked at the patch and found few
> discrepancy that I have mentioned inline.
>

[...]

>
> Aren't all functions returning 0 always?
>

Yes, on purpose. This patch is an API conversion to let the init()
callback of the clock ops return an error code or 0.

The patch is not meant to change anything in the prior behavior of the
clock drivers which is why every exit path return 0 with this change.

IOW, yes there are all returning 0 for now, but it will eventually
change.


>>   *
>>   * @debug_init:Set up type-specific debugfs entries for this clock.  This
>>   *is called once, after the debugfs directory entry for this
>> @@ -243,7 +247,7 @@ struct clk_ops {
>>    struct clk_duty *duty);
>>  int(*set_duty_cycle)(struct clk_hw *hw,
>>    struct clk_duty *duty);
>> -void(*init)(struct clk_hw *hw);
>> +int(*init)(struct clk_hw *hw);
>>  void(*debug_init)(struct clk_hw *hw, struct dentry *dentry);
>>  };
>>
>> --
>> 2.21.0
>
> ________________________________
>  This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
> ________________________________
