Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB7EB5E481
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2019 14:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfGCMtD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 3 Jul 2019 08:49:03 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:44028 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfGCMtC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Jul 2019 08:49:02 -0400
Received: by mail-wr1-f52.google.com with SMTP id p13so2642663wru.10
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2019 05:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=FuvWmI2Ac2pIZhwnDICxrWfsRIUJnwbmAdcXZhrnIuk=;
        b=RVVGw0F7gOGZQ4TEpiyVQ85EpiJgXCb6jLFkfKamOa6QYuyFWojlAQNggohYTdzr2d
         9q2ep+cHOl6daAeiE6MSXobfTG5aGX49Tvu2IO5enl0jIOe6+Fyc7YPKt62Lp3z//l+t
         5afqY4Jrp15R8g77nUuJE0zNLnB+tFRaJJvPrdtgVU2z1eELcxW59gMb5Oc4lSJZx/bT
         yrhnSvteITwxxjIIy0k5vLmKmkPekYMDBmwxbyS+P7F+r3r29MkFd6jsS4TkM4huPNnH
         M1SHjrbF1o55wajA4Td86/gDNbl3yNNhwWYJOd8Rqh38DRdqqOeBuQVLho6nh0gafS1M
         9Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=FuvWmI2Ac2pIZhwnDICxrWfsRIUJnwbmAdcXZhrnIuk=;
        b=i4VnZgeUQppsO9iSbwxTP8jZsH9qTvK8TL9bB43JgDu7FYSSiCTgpd13D2ndyeio44
         lRwJpOqGeTFJFzj2USL3z+SDsmZJZoJtpb+2hVcAMsKmCuBVF/Jowy3XBgtyCq8Yioqx
         7yqtF/2RFG+AmzmnjsFAjC6cteiIaIA0RMPQsX/jm/s4QWzmG8/161ki5mkSrEivQPK7
         1mQN4lazj7vOHnAoMS4EVlgH1MAvtzJFwnW/5zAzDwTE9oKMdhArPAOP8zQ9Jx+gZC6F
         dsKqRJGWGZB9ugjABztCIzDD6vYvUeoEiruaNon9nlv8fgWWbJ4sgvN8A2IuHaXgeXe8
         rmzQ==
X-Gm-Message-State: APjAAAXVZPVmtrz08Yq/ZJ7UJyXd2zqhzLDshuiNW12JuaW+frRaC+XZ
        hi9pFR55uG9cq3Z/p6D/X5wCBg==
X-Google-Smtp-Source: APXvYqyDAfOGOAjcImm7vz1haXRMsa83iykN2nsIK77a4bhegzF3S2j2rg4Wk9JFZ82wUNU8F7il6Q==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr29086502wre.205.1562158140924;
        Wed, 03 Jul 2019 05:49:00 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q1sm1504594wmq.25.2019.07.03.05.49.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 05:49:00 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [RFC/RFT v3 09/14] arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi
In-Reply-To: <e49bfb8f-23e9-c834-62c7-a40528a2ef06@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-10-narmstrong@baylibre.com> <CAFBinCA537EV9kzz+5syaF1Q-stTJ4no+NBdcYD3QL-FJSoWfQ@mail.gmail.com> <e49bfb8f-23e9-c834-62c7-a40528a2ef06@baylibre.com>
Date:   Wed, 03 Jul 2019 14:48:59 +0200
Message-ID: <1jlfxf7078.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 03 Jul 2019 at 13:51, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 03/07/2019 01:54, Martin Blumenstingl wrote:
>> Hi Neil,
>> 
[...]
>> does it make sense to name this file "meson-g12a-g12b-sm1-common.dtsi" instead?
>> do you know whether there will be a successor to G12B and what it's
>> code-name will be?
>
> meson-g12a-g12b-sm1-common seems a bit long to me...

+1 ... and what if the generation after that is compatible as well ? We
extend the name again ? Such naming scheme does not scale.

meson-g12-common.dtsi looks good to me. IMO, The fact the sm1 dtsi includes
the file is enough to understand that sm1 derive from the g12a/b

>
> We don't have naming of the future SoCs, since SM1 is only available on
> prototypes yet.
>
> Neil
>
>> 
>> 
>> Martin
>> 
