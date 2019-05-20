Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF6323247
	for <lists+linux-clk@lfdr.de>; Mon, 20 May 2019 13:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732713AbfETLZy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 May 2019 07:25:54 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55506 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732709AbfETLZy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 May 2019 07:25:54 -0400
Received: by mail-wm1-f68.google.com with SMTP id x64so12869659wmb.5
        for <linux-clk@vger.kernel.org>; Mon, 20 May 2019 04:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=a8JSfyWPrhurVF+a6YBehxq0XiELLPN20L9V0pOBQ88=;
        b=jN2T0EJJC9nrVm9G6jHqkWpTfYhtkxOcQ01/Qltgi71suv8Osq9R4rpgXu1T4SEReh
         U5fz1GMj7pPlKf3Lx8MgseV0dci7d7KhgTJIs2q3BaoYZLupR4rNwLnsNfcTgMOjZv0Z
         wlE0vaXL3PWNAYAaJC9ztgLgb18Cqw5NiuKjHuRw0WVMe3Kfw4ds//5XwTZxiahNXJGs
         gYhQNpyY6GGog+UG0Szr5LGMCtqhA+EGjyVdBOsBHZFoNm4+N0xmwyvWT86V9L8ywsCm
         Yhzq5myOyveT/4iwgL64QNrLCUKneOF04Y0J/stj0hrzx4mdqN54f6408MT87FQwcP5n
         t83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=a8JSfyWPrhurVF+a6YBehxq0XiELLPN20L9V0pOBQ88=;
        b=qklbGgOokKqz76QLTh1DIZkEq9TxitZGneL+L5Ch6mGnUQtQxaxiiI2zc0PtjGhttT
         oBa1rabGzKnKBFwSXMe5WMG1E3JyqLeTpNzBjEUvt6g4jQg09HpcUllE6DDASbijy2qI
         7rlNwPaVIJLb9sX5loUZ3Ok5tLvWOT3mXFXl6+4NyrhGuhmdfWGjGaM1tbakPbaITwh1
         6bqxFnKBWV8b5yRN+mD1zRoN1HCxX8WxJYe+69VDD9c1P2dEn1D/5IedueTqVsLe6lhu
         D/R0Tgev//P8+uOObEfZ8cOoe/IUvd+Bx2GXcpPQV4SGpRlsTlorud5lQcsopsSc/gv0
         LC+A==
X-Gm-Message-State: APjAAAUbMqUD5ri31TNRo3X95b59es2Or/R1Udu6sjuhD7z3ahGARoRC
        2I3dMQi1Nd1Q60ndFF8M9b7jRg==
X-Google-Smtp-Source: APXvYqwD2kE7hPTMQvFvxM4OhbPPbYC4Dnbf3iCvRwrA4vG+2p/HsMn9ltmsGeVfTXhhicksg0OgoA==
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr11933526wmk.103.1558351552239;
        Mon, 20 May 2019 04:25:52 -0700 (PDT)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c12sm4504821wmb.1.2019.05.20.04.25.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 20 May 2019 04:25:51 -0700 (PDT)
Message-ID: <65ca1ca3ed47ec64403600e66a24fe888ba82533.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson: fix MPLL 50M binding id typo
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 20 May 2019 13:25:50 +0200
In-Reply-To: <20190512205743.24131-1-jbrunet@baylibre.com>
References: <20190512205743.24131-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 2019-05-12 at 22:57 +0200, Jerome Brunet wrote:
> MPLL_5OM (the capital letter o) should indeed be MPLL_50M (the number)
> Fix this before it gets used.
> 
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Fixes: 25db146aa726 ("dt-bindings: clk: meson: add g12a periph clock controller bindings")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

applied to v5.3/fixes

