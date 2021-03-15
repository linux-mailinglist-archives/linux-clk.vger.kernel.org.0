Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C868033AC30
	for <lists+linux-clk@lfdr.de>; Mon, 15 Mar 2021 08:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhCOH0B (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 15 Mar 2021 03:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhCOHZh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Mar 2021 03:25:37 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB2CC061574;
        Mon, 15 Mar 2021 00:25:37 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id i18so8380271ilq.13;
        Mon, 15 Mar 2021 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=El/Z4kuthdiADlQl60tq0sGwr4QoamUBccbw5uaJ4G0=;
        b=jOTgMPq+tWjs17/lAC4W47Oqpm0t2FN+FfbmeAiWNsFVbVWBI5RXbR/orZe1qZW26M
         zUlU7YkWlL3m0RAVJ8E3jp2CiI2tGTi1mzwf3HXTL/nVHGpqusztsymw68Z/VSEXRXST
         vMzCmd8vDmQ7wRfiK7paur8gTJ28CcwBT0fkxznHLYNIjlHlk4GoBfLH6nGkFwwtxL6v
         C4dzyg4lqAbftgYU8oBSI7eADsSsVgsEznwBHWLdqtlz2qNcN9sX9K33aOGOaJncwZqW
         wRzAtYPBbVYNGf7RpR7KJ8y88yoLNpdV5G+UfWkV8Q6Uy5gRYMhHzbQ2Yb4qd18PPJmP
         E+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=El/Z4kuthdiADlQl60tq0sGwr4QoamUBccbw5uaJ4G0=;
        b=VUts4c4TKUn52anZfhGZR3qZKAaPldxjITDo29BnTezcCsm+N52xuREOkRSCIfOZLV
         gD0luqhRFwQ5v2WWDb37Wnyqz6g4aNjhRLDvmSr8GJpOmWoUz0p+LJSKbpcYNvwd8+4q
         UMMpl9SXoR5b9eWPgoCL+GcOTErxRivP4b95bSypChJIMBZCWE4fd81iODiw0SxiL+7x
         P9lTgDQ/TMyYyueAiwGDZ19fspDrvuvHDpheUW7PRLvfovbr+HoU4qjBKoaDIR61bJfn
         FWBzpZDI0E70/eqtVBQdQdPLQe/VkeZjN5SPeNlE3dXGst6PZplT9P0khWj8BwYKdUhl
         31Sg==
X-Gm-Message-State: AOAM531NZoCV+h68yDRo2IJJmQmpbFuS2DDiPY4lt28SYmZOJEf8ts0+
        WWzBZUdf6DDXN2l4a/d3nNeMks12+PElWyqWCp8=
X-Google-Smtp-Source: ABdhPJz5F39VTH4DfBEwVHNGC65kxG1T9jL5ydnQB7l0HGRpq/+lB0JN68hx4tzBlgqpn6P3KDVs2Jxp2e81J5xTnEk=
X-Received: by 2002:a92:ca07:: with SMTP id j7mr10636820ils.144.1615793137102;
 Mon, 15 Mar 2021 00:25:37 -0700 (PDT)
MIME-Version: 1.0
From:   Zhengxun Li <zhengxunli.mxic@gmail.com>
Date:   Mon, 15 Mar 2021 15:25:26 +0800
Message-ID: <CACY_kjQcJmQaDY2gDxG4TcztsYEmCETTWtLwZDfv9Q+JEsoe7g@mail.gmail.com>
Subject: Re: [PATCH v10 6/9] staging: clocking-wizard: Add support for
 fractional support
To:     shubhrajyoti.datta@xilinx.com
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        git@xilinx.com, gregkh@linuxfoundation.org,
        linux-clk@vger.kernel.org, miquel.raynal@bootlin.com,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org,
        shubhrajyoti.datta@gmail.com, juliensu@mxic.com.tw,
        slwu@mxic.com.tw, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

+static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
+       unsigned long parent_rate)
+{
+ int err;
+ u32 value, pre;
+ unsigned long rate_div, f, clockout0_div;
+ struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+ void __iomem *div_addr = divider->base + divider->offset;
+
+ rate_div = ((parent_rate * 1000) / rate);

In some cases, the variable seems to overflow.

Thanks,
Zhengxun
