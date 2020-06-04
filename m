Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB451EEC09
	for <lists+linux-clk@lfdr.de>; Thu,  4 Jun 2020 22:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729902AbgFDU37 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 4 Jun 2020 16:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729828AbgFDU36 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Jun 2020 16:29:58 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2B0C08C5C3
        for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2020 13:29:56 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id n23so4002660pgb.12
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2020 13:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bnsaMm5xHsmGTKM8crY5633RBfnrE452zASAiUrFU6c=;
        b=N9f0DBz11v8qKCu5VA9JXvurX/AQtTOXbiTH5jmNKefXzNsIFm+M7WPzmoaUlp4aH2
         r+jMi/YmukLuVqYctzsJtxcn0mVNYhMsSNT9VA6N7PnsQg5yUlK9mfLk/5/Ruh0U/Pwu
         PDPRxMt4IzbnxQDI/neSyUM1ytXRkW/vLuLZKE80o7Nj5PUF2JyDsoKL+PvQ95dTnNfZ
         KgrObLpuy2lSQ1b3DD2riryZUDl8/MGtuP3prwyWT2YzcrBoR4Z0ygA8w4IwkVOIQfT2
         XknAaA0BFuOmwbwTbgOy7UCAxJmRzkJu3RwBQHvX6d2dQvm2RBoWXIh1YpGHB5SsL5b+
         hRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bnsaMm5xHsmGTKM8crY5633RBfnrE452zASAiUrFU6c=;
        b=FZTydunfCkW/wNKdHLS56dil8I9aTW1W4foHv+qL0Xp2sxSJOsYOR4gqTo5WRzL1h8
         YYO/ccAUxcZCMC0K5bHzqHHBHGg2v/3+Tksm6buObDglONWKca6V4cmdf5PBJHE+aZbl
         WOHgKXBrsxu+P/i15Be4JmkyCchJFecE52PU4n67UjosNaUyYDMcizEatJCqpk77/tg+
         6vke0kb6SxyjTlA/u5EI7EmjmSftnVYUs34fgV8kl+PesP4sj/I39oRyLks+ZzNDYZnC
         D5aXvnnoVcwmrKvfI9rW1pjXnG81APnhqEpTjCO6NA4CchYWCJGSnnOA9fjwRwKf2VPi
         b5SQ==
X-Gm-Message-State: AOAM530icjHYiTMLXzWLhGYPtFh0OES+WkZq8GKuEvkmQPIdaRwaoe5r
        05EZj0jQIIsB2ey+hUbauS+B7a2PXmvgE8TH5vFmEA==
X-Google-Smtp-Source: ABdhPJy84Bpyo9gVnHDmhNZ0Cl7JJ5pAaUOhbP1nHyEJIJ3dMgwhwkaPgsD+FnKg2zDZj7i1oTdj2nlsRsGHJYRwQ7w=
X-Received: by 2002:a63:f00d:: with SMTP id k13mr6286936pgh.263.1591302596138;
 Thu, 04 Jun 2020 13:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-1-keescook@chromium.org>
 <20200603233203.1695403-6-keescook@chromium.org> <CAKwvOdm5zDide5RuppY_jG=r46=UMdVJBrkBqD5x=dOMTG9cZg@mail.gmail.com>
 <202006041318.B0EA9059C7@keescook>
In-Reply-To: <202006041318.B0EA9059C7@keescook>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 4 Jun 2020 13:29:44 -0700
Message-ID: <CAKwvOdk3Wc1gC0UMsFZsZqQ8n_bkPjNAJo5u3nfcyXcBaZCMHw@mail.gmail.com>
Subject: Re: [PATCH 05/10] ide: Remove uninitialized_var() usage
To:     Kees Cook <keescook@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        b43-dev@lists.infradead.org,
        Network Development <netdev@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 4, 2020 at 1:20 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Jun 04, 2020 at 12:29:17PM -0700, Nick Desaulniers wrote:
> > On Wed, Jun 3, 2020 at 4:32 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > > (or can in the future), and suppresses unrelated compiler warnings (e.g.
> > > "unused variable"). If the compiler thinks it is uninitialized, either
> > > simply initialize the variable or make compiler changes. As a precursor
> > > to removing[2] this[3] macro[4], just remove this variable since it was
> > > actually unused:
> > >
> > > drivers/ide/ide-taskfile.c:232:34: warning: unused variable 'flags' [-Wunused-variable]
> > >         unsigned long uninitialized_var(flags);
> > >                                         ^
> > >
> > > [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> > > [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> > > [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> > > [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> > >
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Thanks for the reviews!
>
> > Fixes ce1e518190ea ("ide: don't disable interrupts during kmap_atomic()")
>
> I originally avoided adding Fixes tags because I didn't want these
> changes backported into a -stable without -Wmaybe-uninitialized
> disabled, but in these cases (variable removal), that actually does make
> sense. Thanks!

Saravana showed me a cool trick for quickly finding commits that
removed a particular identifier that I find faster than `git blame` or
vim-fugitive for the purpose of Fixes tags:
$ git log -S <string> <file>
I've added it to our wiki:
https://github.com/ClangBuiltLinux/linux/wiki/Command-line-tips-and-tricks#for-finding-which-commit-may-have-removed-a-string-try.
I should update the first tip; what was your suggestion for
constraining the search to the current remote?
-- 
Thanks,
~Nick Desaulniers
