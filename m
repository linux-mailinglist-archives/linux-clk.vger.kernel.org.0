Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFE43E2C27
	for <lists+linux-clk@lfdr.de>; Fri,  6 Aug 2021 16:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236820AbhHFOLE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Aug 2021 10:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237142AbhHFOLB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Aug 2021 10:11:01 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4699CC0617A2
        for <linux-clk@vger.kernel.org>; Fri,  6 Aug 2021 07:10:43 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y34so18153214lfa.8
        for <linux-clk@vger.kernel.org>; Fri, 06 Aug 2021 07:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/oMubRmlLM5EZ/UdY6Fj3wsfS2kyoMzN9ASXgZ3xneY=;
        b=q3xyYt1HrVQnyL1KZndhIFKim0Z6RZXWCajZa6+jKaUt/xPBmWrU2b2TpwIqgxHoY3
         6sUeXJPoUC3zz+xqx5Y/7bh16ON7BcCcP2liy5jl/yv+hyxVGmxIcBCDJXoapuOO0RIl
         REN9Zv+ClhtVVEMybVDTEUTnyt+YraWqvgNO4CiPEvSNbjJp0ymaQzc4FwPALfOqM4La
         f+KzIMXFoGuca5XlZdCXXnnqi+xUiOGsem/cV9JUjNFonSZWOzEGazowyEr2eG3dp5DR
         pLBa7cN2FmOkeXw/dSFAaB7k29Eu0Yivashc8iQbXHlro4ZoI7aiyRP21+G8wGDlMmu6
         HPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/oMubRmlLM5EZ/UdY6Fj3wsfS2kyoMzN9ASXgZ3xneY=;
        b=Mm/4Vl4JvjCS2ZscGp4ErY1oKrT9PuFvr3NW18l0bxEhYzT8Hf7K1kIO/zHr6cyT1S
         Bgv7qCDLWC8yJI4BV+3WZEtzzGDv6hrprFCODsYNqC9bdc27ewAUJI/1ODnj2Ry/C45a
         HZLLtYwLfAh4IDtvCWx95V5NPr5HYPzPVqNMHhN5CKsD7MIGK1YHr89rUIJjFpeOIS7x
         FunRvl9ySil0UQ8zpNA1refWVNXcFI7fHMyqZhDVxLCEFE+4YQEiRZmpGp9KcYPDMHUI
         6UU1npuIOCI/oKqNDOz85EnoGvwdyzaK5ghAQY8Y9EOyBjN8qVlawc8yRPi+iQqWgKSa
         gMLQ==
X-Gm-Message-State: AOAM533geP6+qV5tN35ZsYahbvMZjOEBhC4JB3FXeqTuOoJYyySfsgx/
        8FvEbJTST1W5lKL+ruiUqqZHMZOm5GqDXr0Nn7eRg0op66hXLsZsxw==
X-Google-Smtp-Source: ABdhPJx229jhz+o+nQwdgIkoqR5HwLh3S4+JGHt0eG+5fB4X3WTmNmInTj1ZpuXDIVm9CYEhhFZzLyuZYbLrplGdX6A=
X-Received: by 2002:a05:6402:3094:: with SMTP id de20mr13526197edb.272.1628259031175;
 Fri, 06 Aug 2021 07:10:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:26cf:0:0:0:0:0 with HTTP; Fri, 6 Aug 2021 07:10:30 -0700 (PDT)
Reply-To: mrmaxwellwatford@gmail.com
From:   Maxwell Watford <orchowskiruthi@gmail.com>
Date:   Fri, 6 Aug 2021 14:10:30 +0000
Message-ID: <CA+q9Q6OJB6Z0+y=5_3MBDNGkAUG9rVxg7bZVma38uDOvJ+sOGw@mail.gmail.com>
Subject: i need your reply
To:     orchowskiruthi@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Greetings,

We are writing to you from Ecowas Finance Controller Office Lome Togo,
because we have received a file from the Ministry of Finance Lome-
Togo, concerning an Inherited Fund bearing your name on it, And after
our verifications, we found out that the funds belong to you.

It has been awarded and I will like to guide you to claim the funds.
Please contact me at my private email address
(mrmaxwellwatford@gmail.com) for more information and directive

I am looking forward to your urgent reply,
Best regards
Mr Maxwell Watford
