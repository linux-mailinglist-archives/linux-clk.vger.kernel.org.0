Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFF417515E
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jul 2019 16:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbfGYOi2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 25 Jul 2019 10:38:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50482 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbfGYOi2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Jul 2019 10:38:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id v15so45258121wml.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Jul 2019 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=xKhjaESpwvk6sR4/SITRYpcTnlFG6jIulb5Z7EfG/G8=;
        b=V1ADhv36o2+cFrscOoSHKnRjQaO9dDNPwd3Ahh6Kl9afPgC4H7hsakbzpEII9ZBu3/
         LtKUTgwGP2hJW4bT58gqaxPReeLUWvqMGCpXPUyrP2WYF1zGLO+3neKuDwwo+Y3FHCkE
         Wvtcz3x2U+4xnulIqZltKgwoIt38DxPDPPyDf0XK3AqxmKDqo2E7Y49/iUffPrC/TJsv
         NYdXwTKkWfoIiM8q8r1eJXEbaHZSwVM7s1gB2mHAPGnEbGDnwE8T9PNUTUikrXHii2T9
         wA0jAXz+9MA1wlhWFtP21oNGb7/Ahj3vr3lwVYFCVAXVtbenOm+Zdo596KtqjgZ91d61
         lprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=xKhjaESpwvk6sR4/SITRYpcTnlFG6jIulb5Z7EfG/G8=;
        b=goHJnaMBvTScYt9jaMLKNn39cAv3lOp4nCPfJTB4roMaIKG4cs/nHpWkMrKNx5sKqo
         7x0KKJuQtjM1KRUvDi7turnXwqBRTEfjC1reNNnsFFvKLoK862NYe5Jb7KRqOynFYIBK
         DPE812uutXwLDeE1dfqB3ZVQSNTRpcqhv1FUciNpA96N160bmwVPv2mmL3XG5CmoIjf6
         3W662Cgd7eS94ithcFDMiYQCps4MdIavwkH9aZONSsl0aDumwDWLPEaIVWsPuugVSJCM
         Bfucvqb9JJ2zbx9ODkjfy2inD+uIKOta+SMTszeqkUxzg3O8if+dyJjxNZ6LL5u6mlwo
         FKZg==
X-Gm-Message-State: APjAAAX3jtk8ZuQSs9HmHVV//1PBCdJpjt9dnr+4QbkAmZ7p+gO8+BIi
        cq+beF5RzOnAVdkWHOb2c3Gx0g==
X-Google-Smtp-Source: APXvYqxUa4coqzdXQVeu4+Cob/EMTrXyHltG48aeyxm8e5yNgpQ4cUf2+pfTE9+Acv3S/pIJ6kzOxA==
X-Received: by 2002:a1c:9e4d:: with SMTP id h74mr84250838wme.9.1564065506038;
        Thu, 25 Jul 2019 07:38:26 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z1sm51923870wrv.90.2019.07.25.07.38.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 07:38:25 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     khilman@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        baylibre-upstreaming@groups.io,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] clk: meson: axg-audio: migrate to the new parent description method
In-Reply-To: <20190722094954.14040-1-amergnat@baylibre.com>
References: <20190722094954.14040-1-amergnat@baylibre.com>
Date:   Thu, 25 Jul 2019 16:38:24 +0200
Message-ID: <1jd0hyxjq7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 22 Jul 2019 at 11:49, Alexandre Mergnat <amergnat@baylibre.com> wrote:

> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 8028ff6f6610..4253a466eae8 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -15,7 +15,6 @@
>  #include <linux/slab.h>
>  
>  #include "axg-audio.h"
> -#include "clk-input.h"
>  #include "clk-regmap.h"
>  #include "clk-phase.h"
>  #include "sclk-div.h"
> @@ -24,7 +23,7 @@
>  #define AUD_SLV_SCLK_COUNT	10
>  #define AUD_SLV_LRCLK_COUNT	10
>  
> -#define AUD_GATE(_name, _reg, _bit, _pname, _iflags)			\
> +#define AUD_GATE(_name, _reg, _bit, _phws, _iflags)			\
>  struct clk_regmap aud_##_name = {					\
>  	.data = &(struct clk_regmap_gate_data){				\
>  		.offset = (_reg),					\
> @@ -33,13 +32,13 @@ struct clk_regmap aud_##_name = {					\
>  	.hw.init = &(struct clk_init_data) {				\
>  		.name = "aud_"#_name,					\
>  		.ops = &clk_regmap_gate_ops,				\
> -		.parent_names = (const char *[]){ _pname },		\
> +		.parent_hws = (const struct clk_hw *[]) { &_phws.hw }, \

Those '\' are aligned with tabs. please check, you have aligned a few
with spaces instead

>  		.num_parents = 1,					\
