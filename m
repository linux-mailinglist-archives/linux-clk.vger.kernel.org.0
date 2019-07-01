Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 475155A2EC
	for <lists+linux-clk@lfdr.de>; Fri, 28 Jun 2019 19:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfF1R6f (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 28 Jun 2019 13:58:35 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:46432 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbfF1R6f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jun 2019 13:58:35 -0400
Received: by mail-pg1-f177.google.com with SMTP id v9so2897732pgr.13
        for <linux-clk@vger.kernel.org>; Fri, 28 Jun 2019 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Vl3V/b9d/YR3BoBzMucBuY8z9bflVwMcEzHAzE43M8M=;
        b=GiHzQpHEBzX787s/X1QIF6dApBZZr+1I94MMXG75kyPqsnypZvvVmyPXmqQ4DDWDP1
         BzcS004uag+6zBmiVow3iazQZwCovOnO+ZHlIt9I21QnI0F6Nflvj4dUWBUbhq7AbO/m
         SynTdJ4H2/6gv6sVDQ/Y6+Xb3rJWkBq67DXPBHgz+cu1AXl9k8kEn7My8wk8Hf4WKSc2
         DZFzfS/MxxvfSALWkxuMLiVFMJYmOEgRUhfPMprrAJXGAmg42GEl4SGnDGCvrnJcyTse
         bBCzUsjp+9FQDvCouNixum4aYfj7dm7fTO1MgaM/A1Gdfa8Xw4iAsFFkjztnwVtxortw
         zQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Vl3V/b9d/YR3BoBzMucBuY8z9bflVwMcEzHAzE43M8M=;
        b=bAS+z/FFbXcntk5jUWjd13PRLREIG47J1uvd7ewaHJfVMk/TUS0BohquBz1OAd7Tlt
         Zvny3uV8nBidPcdJBDiPaWG6VVAtjSXH4zcPMQ1/09VgvZN+iYT8DN7rghv+3OSLPT2/
         uWvSWzOdtuly6y0Ym5MSeUTt9IWeC3CVTOCr4GUtp2ec/WAm8/AHE0IQ1ug/s5ptyCPV
         4CHQ0tFYngN7jV9MFbO/wVwKBy+P3AVluFnl8Cswi5axN6g+QzLpJS9PJIdHpE9HmXX5
         MOwVJnc3Aj/duePeQwwKsZil9E0fYwj1tovt1kg0SlmdHwFZRF21OV4Hbyq29VMe6Mta
         gOKA==
X-Gm-Message-State: APjAAAWTO/8KKwQQryT4GED5ExgkuU6ZCKjiPT1EcS9//F9H/6i+qLVZ
        fiDG/S8/cBZGu1ALiO3OV+POAQ==
X-Google-Smtp-Source: APXvYqz3zRSNG8ksCoG/kgVrFj0M6c77+R2i6vSlgO/BJ1CePZMBP9OvFZEvXFjF5JaAwCqI6GsMBQ==
X-Received: by 2002:a63:e057:: with SMTP id n23mr10491079pgj.228.1561744714489;
        Fri, 28 Jun 2019 10:58:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id 3sm2963791pfp.114.2019.06.28.10.58.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 10:58:33 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC/RFT v2 06/14] soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk
In-Reply-To: <20190626090632.7540-7-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com> <20190626090632.7540-7-narmstrong@baylibre.com>
Date:   Fri, 28 Jun 2019 10:58:33 -0700
Message-ID: <7hpnmxr3qu.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Add the G12B second CPU cluster CPU and SYS_PLL measure IDs.
>
> These IDs returns 0Hz on G12A.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
