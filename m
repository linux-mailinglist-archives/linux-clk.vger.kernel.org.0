Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78349449CA
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jun 2019 19:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbfFMRly (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 Jun 2019 13:41:54 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39806 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfFMRly (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jun 2019 13:41:54 -0400
Received: by mail-qk1-f194.google.com with SMTP id i125so13316760qkd.6
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2019 10:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=znrYd7kPsXyXAwfYH7xJxUXj1XKDDXu18nA2wghybU4=;
        b=uqOVke8S1gDDw3ySGtzk/HZT47/YVoOjoN4s0HDDuOIOSuaHS9k96Z1JDh/vnC0E6r
         rbRSjY6vEttsVgnNnU4X9PI4saELaVwM8sgvPpU4uALHGymqT537Vl+AthqX/r10fFTN
         gCv8hKu+2ygLzEclE3xTJ18ejBNbQITsR2YuW4fW/dXtXWd0kIxah3rTz9vnHB0BgqoB
         HLJNQ2segz6drY+Exhq3u76N3T+zwInfYL7Y2D2B73ZLb7MlCgd8tOuk5/nUPwRbuOYg
         85GF3H2innfQJbamjaqSD0OirVIIVh18L8uy7rXWdGz+gcDUY5XXoGQ4BdWLOQ4w7Cy8
         +NaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=znrYd7kPsXyXAwfYH7xJxUXj1XKDDXu18nA2wghybU4=;
        b=ai4lmlC6+WjitUw5Mnbp4i9T6pqBkUeyHhoVjXqqMSijUNRSl6F1jCT6cC9a4qEujK
         LccPRgkD/QL1SUo+qZvjIzWdpDOiZcShEJ00Y6G6tmPobkqtIvXa2QzqpurmHGn2ql9D
         ImY6oPJVdkqMR5YIZq2sXxsVCn7Q/BM244OxODMXgyMaUFrcI2pMmjABg7OIGc4raNTd
         SGOa8RDOPRy/eYyZPC7eUJZNSNIdX6Z5wbVGWpgK8nL8MIwEIQKJpMmGQtF7PE6a4CQ5
         hqf0MwSpC51vqPvRpwHLYARV3zqWBlU6VKjUe9HAH4pj4AooTty55zfqgJe7KsiHExvR
         T06g==
X-Gm-Message-State: APjAAAVRsjkqHdcWjNJzfjA+MGAHteI6I3xDGwsOor1uIDVlf6UBwGHq
        Q2jPXGB9dfsi/ocSJ/bAfuwVdBkPYDmljSL2Il+s9A==
X-Google-Smtp-Source: APXvYqy2LZudB8Tf21SWqHPQSyT/yXKbAb3NdC/zLYsVWNbgvN7vIx0nABVWEKQPSl0WcxnjiteVbF1pdfvZ+1ZubRc=
X-Received: by 2002:a37:634f:: with SMTP id x76mr70478855qkb.205.1560447713808;
 Thu, 13 Jun 2019 10:41:53 -0700 (PDT)
MIME-Version: 1.0
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Thu, 13 Jun 2019 10:41:43 -0700
Message-ID: <CAJkfWY7qEX3AX3BMqYUranCeQ1j-MvQiZtqesBfwOOW-ZpqkcQ@mail.gmail.com>
Subject: Cleanup of -Wunused-const-variable in drivers/clk/clk-qoriq.c
To:     scottwood@freescale.com,
        Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        tglx@linutronix.de
Cc:     linux-clk@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hey all,

I'm investigating compiler warnings in the kernel and noticed a couple
unused variables.

https://github.com/ClangBuiltLinux/linux/issues/525

It looks like the wrong clockgen_muxinfo is being used in the p5020's
clockgen_chipinfo. Just wanted to make sure this is not intended
behavior before submitting a patch.

Thanks,
Nathan Huckleberry
