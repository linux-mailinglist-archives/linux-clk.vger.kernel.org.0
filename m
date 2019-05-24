Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6964B29A75
	for <lists+linux-clk@lfdr.de>; Fri, 24 May 2019 17:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404153AbfEXPAP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 May 2019 11:00:15 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34414 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404146AbfEXPAO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 May 2019 11:00:14 -0400
Received: by mail-wm1-f66.google.com with SMTP id e19so2126183wme.1
        for <linux-clk@vger.kernel.org>; Fri, 24 May 2019 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=tYO8xGiz+RMM7SdKcq5icVUr0kYvXsRXx61HYgQU2Mw=;
        b=WPubbuxSZ6dIlhb6fVIR0gkJupkWupwQovAVpDfVRGnrhAK+tkmjaE5SwJ4EN5e9xN
         RM9V2CiPpY3Mo0mHHsP+S2VKzBdUA3NdUwUZCtfgwn1V/+PRNAvF5Q+YIaVjIu2WvLaw
         +0e2NxuayZj1k/gDKjFUDungFhGXx3cunnIZF8+u07wODJPoknnA5tbo5YPFhxWT8vZR
         +63h+Kmm1p+2O32hXpTqg/628SSrhWhqhO4MP+TYuDuk8BVcsaMXfweFlesRstc7noUt
         WdyOy0ZNOt+DoUUBT6yRVV8IiRAocOV4U0uJTlfKiq2mm8DB9mjEHWEJqhbe6XFSrHRo
         Z78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tYO8xGiz+RMM7SdKcq5icVUr0kYvXsRXx61HYgQU2Mw=;
        b=g6Fa+BDbZzcEW4IVlxEBe9XUYWtrToMlrurir9MCli10cwC+z59Yi3yohv7RZ5W99S
         JCD6d8C938fa+RNlZXY+Ogl5oC72+G77Rdbi0UvBZ1uL1egEDMbj9qlRhiW7PT0S80KO
         M9U8iSDkb4FLk9TiXA8utOT3zypCWlS5g19ezeXPf74D/bl13P/qEju8YUHHs7QngNXB
         BTHSqGBt/h2ZZpWlf8VVlDYAcRY58Xln1n6u9CWklfogrwJ8U9X6N7d8TmskB0P57Qa1
         6uSGQKX4L7v37YQ4CQfNPgxWeVyhWECSo4nXAkVIQObXD/6N07xv2bzBrELy31LyjaFs
         gA4g==
X-Gm-Message-State: APjAAAXWuFBf7aZvg+EjiFwWfVRYm1VCNi6MvDHb9IEKyoiWjwk5EZ37
        v9GS1UJmHyvabt7BsTQdzpcvGQ==
X-Google-Smtp-Source: APXvYqzHRrpm6DGECW0/akrCngmp6DM2AHbe5ke0arjO3bqFmpXmgGi0OjqvRM9cjNRSmVwZHYwHBA==
X-Received: by 2002:a7b:c8d1:: with SMTP id f17mr8013378wml.45.1558710012556;
        Fri, 24 May 2019 08:00:12 -0700 (PDT)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h17sm330152wrp.48.2019.05.24.08.00.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 24 May 2019 08:00:11 -0700 (PDT)
Message-ID: <c89ecb6f328014ce22ae5d6c634e5337dbbf3ea2.camel@baylibre.com>
Subject: Re: [PATCH] clk: fix clock global name usage.
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        baylibre-upstreaming@groups.io
Date:   Fri, 24 May 2019 17:00:08 +0200
In-Reply-To: <20190524143355.5586D2133D@mail.kernel.org>
References: <20190524072745.27398-1-amergnat@baylibre.com>
         <20190524143355.5586D2133D@mail.kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 2019-05-24 at 07:33 -0700, Stephen Boyd wrote:
> Do you set the index to 0 in this clk's parent_data? We purposefully set
> the index to -1 in clk_core_populate_parent_map() so that the fw_name
> can be NULL but the index can be something >= 0 and then we'll use that
> to lookup the clk from DT. We need to support that combination.
> 
>         fw_name   |   index |  DT lookup?
>         ----------+---------+------------
>         NULL      |    >= 0 |     Y
>         NULL      |    -1   |     N
>         non-NULL  |    -1   |     ?
>         non-NULL  |    >= 0 |     Y
> 
> Maybe we should support the ? case, because right now it will fail to do
> the DT lookup when the index is -1.

Hi Stephen,

We are trying to migrate all meson clocks to the new parent structure.
There is a little quirk which forces us to continue to use legacy names
for a couple of clocks.

We heavily use static data which init everything to 0.
Here is an example:

static struct clk_regmap g12a_aoclk_cts_rtc_oscin = {
[...]
 	.hw.init = &(struct clk_init_data){
 		.name = "g12a_ao_cts_rtc_oscin",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "g12a_ao_32k_by_oscin",
-						  IN_PREFIX "ext_32k-0" },
+		.parent_data = (const struct clk_parent_data []) {
+			{ .name = "g12a_ao_32k_by_oscin" },
+			{ .fw_name = "ext-32k-0", },
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
};

With this, instead of taking name = "g12a_ao_32k_by_oscin" for entry #0
it takes DT names at index 0 which is not what we intended.

If I understand correctly we should put
+			{ .name = "g12a_ao_32k_by_oscin", index = -1, },

And would be alright ?

While I understand it, it is not very obvious or nice to look at.
Plus it is a bit weird that this -1 is required for .name and not .hw.

Do you think we could come up with a priority order which makes the first
example work ?

Something like:

if (hw) {
	/* use pointer */
} else if (name) {
	/* use legacy global names */
} else if (fw_name) {
	/* use DT names */
} else if (index >= 0) 
	/* use DT index */
} else {
	return -EINVAL;
}

The last 2 clause could be removed if we make index an unsigned.

Cheers
Jerome

> 
> So this patch instead?


